import mariadb
import sys
from datetime import datetime
from scrappers.ohiggins_elcachapoal import noticias as news
from extract_persons import dic

import wikipedia
wikipedia.set_lang("es")
import pageviewapi
print("wikipedia OK")

from transformers import AutoModelForQuestionAnswering, AutoTokenizer
from transformers import pipeline
ES_MODEL_LANGUAGE="mrm8488/bert-base-spanish-wwm-cased-finetuned-spa-squad2-es"
tokenizer_es_language = AutoTokenizer.from_pretrained(ES_MODEL_LANGUAGE)
model_es_language = AutoModelForQuestionAnswering.from_pretrained(ES_MODEL_LANGUAGE)
q_a_es = pipeline("question-answering", model=model_es_language, tokenizer=tokenizer_es_language)
print("transformers OK\n")

import warnings
warnings.filterwarnings("ignore")

def crearFecha(fecha):
    meses = {"enero":1,"febrero":2,"marzo":3,"abril":4,"mayo":5,"junio":6,"julio":7,"agosto":8,"septiembre":9,"octubre":10,"noviembre":11,"diciembre":12}
    lista = fecha.split(" de ")
    # print(f"{fecha} {lista}")
    if(len(lista) == 1):
        if(lista[0].isnumeric()):
            date = datetime.strptime(f"{lista[0]}-01-01", '%Y-%m-%d').strftime('%Y-%m-%d')
        else:
            date = datetime.today().strftime('%Y-%m-%d') #Fecha no válida (se ingresará la fecha actual para rellenar)
    elif(len(lista) == 2):
        lista[1] = meses[lista[1]]
        date = datetime.strptime(f"2000-{lista[1]}-{lista[0]}", '%Y-%m-%d').strftime('%Y-%m-%d') #Si no da el año
    else:
        lista[1] = meses[lista[1]]
        date = datetime.strptime(f"{lista[2]}-{lista[1]}-{lista[0]}", '%Y-%m-%d').strftime('%Y-%m-%d')

    return date

""" --------------------------------------------- """

try:
    conn = mariadb.connect(
        user="root",
        password="root",
        host="127.0.0.1",
        port=3306
    )

except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

cur = conn.cursor()
cur.execute("USE medios_de_prensa")

############## MEDIOS ##############
medios = []
medios.append({"nombre":"El Cachapoal","url":"https://elcachapoal.cl/","region":"Ohiggins","pais":"Chile","fecha":"2003-11-05","tipo":"regional","idioma":"es"})
medios.append({"nombre":"El Rancaguino","url":"https://www.elrancaguino.cl/","region":"Ohiggins","pais":"Chile","fecha":"1938-01-15","tipo":"regional","idioma":"es"})
medios.append({"nombre":"La Noticia Online","url":"http://lanoticiaonline.cl/","region":"Ohiggins","pais":"Chile","fecha":"2014-07-25","tipo":"regional","idioma":"es"})

for m in medios:
    query = f"INSERT INTO medios (nombre, url, region, pais, fecha, tipo, idioma) VALUES ('{m['nombre']}', '{m['url']}', '{m['region']}', '{m['pais']}', '{m['fecha']}', '{m['tipo']}', '{m['idioma']}')"
    cur.execute(query)

############## NOTICIAS ##############
for n in news:
    query = f"INSERT INTO noticias (url, titulo, fecha, contenido, id_medios) VALUES ('{n['url']}', '{n['titulo']}', '{n['fecha']}', '{n['contenido']}', 1)"
    cur.execute(query)

############## PERSONAS ##############
c = 0
for t,persons in dic.items():
    for person in persons:
        c += 1
        print(person)
        
        try:
            results= wikipedia.search(person)
            summary= wikipedia.summary(results[0], sentences=3)

            #Preguntas
            result1 = q_a_es(question="¿Cuál es su fecha de nacimiento?", context=summary)

            result2 = q_a_es(question="¿Cuál es su profesión?", context=summary)

            result3 = q_a_es(question="¿Cuál es su nacionalidad?", context=summary)
            
        except:
            #No tiene página wikipedia
            cur.execute(f"INSERT INTO personas (nombre, wiki) VALUES ('{person}',false)")
            print("No tiene página de Wikipedia\n--------------------")
            continue

        date = crearFecha(result1['answer'])
        
        print("Nació el "+date)
        print("Su profesión es "+result2["answer"])
        print("Es "+result3["answer"])
        cur.execute(f"INSERT INTO personas (nombre, wiki, profesion, nacimiento, nacionalidad) VALUES ('{person}', true, '{result2['answer']}', '{date}', '{result3['answer']}')")

        ############## POPULARIDAD ##############
        try:
            result=pageviewapi.per_article('es.wikipedia', person, "20220601", "20220630",
                        access='all-access', agent='all-agents', granularity='daily')
            dia = 1
            for item in result.items():
                for article in item[1]:
                    views=article['views']
                    if(dia < 10):
                        diaStr = "0"+str(dia)
                    else:
                        diaStr = str(dia)
                    cur.execute(f"INSERT INTO popularidad (visitas, fecha, id_personas) VALUES ({views}, '2022-06-{diaStr}', {c})")
                    dia += 1
        except:
            print("Fallo al conseguir la popularidad de la persona")
        print("--------------------")

############## PROPIETARIO ##############
cur.execute("INSERT INTO propietario (nombre, persona) VALUES ('Miguel González Navarro','Natural')")
cur.execute("INSERT INTO propietario (nombre, persona) VALUES ('Héctor González Valenzuela ','Natural')")
cur.execute("INSERT INTO propietario (nombre, persona) VALUES ('Alejandro González Pino','Natural')")

############## POSEER ##############
cur.execute("INSERT INTO poseer (fecha, id_medios, id_propietario) VALUES ('1915-08-15', 2, 1)")
cur.execute("INSERT INTO poseer (fecha, id_medios, id_propietario) VALUES ('1955-08-15', 2, 2)")
cur.execute("INSERT INTO poseer (fecha, id_medios, id_propietario) VALUES ('2005-08-15', 2, 3)")

############## MENCIONAR ##############
c = 1
for id,personas in dic.items():
    for persona in personas:
        # print(f"{c} {persona}")
        cur.execute(f"INSERT INTO mencionar (id_noticias, id_personas) VALUES ({id},{c})")
        c += 1

conn.commit() 
conn.close()