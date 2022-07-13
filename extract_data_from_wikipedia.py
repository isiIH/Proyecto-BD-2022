# Popularidad, profesión, fecha de nacimiento
from extract_persons import dic

from datetime import datetime
from datetime import timedelta 

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

""" --------------------------------------------- """

fecha = (datetime.today() - timedelta(days = 1)).strftime('%Y%m%d') #Fecha de ayer

for _,persons in dic.items():
    for person in persons:
        print(person)
        
        try:
            results= wikipedia.search(person)
            summary= wikipedia.summary(results[0], sentences=3)
            result=pageviewapi.per_article('es.wikipedia', person, fecha, fecha,
                        access='all-access', agent='all-agents', granularity='daily')

            #Preguntas
            result1 = q_a_es(question="¿Cuál es su fecha de nacimiento?", context=summary)

            result2 = q_a_es(question="¿Cuál es su profesión?", context=summary)

            for item in result.items():
                for article in item[1]:
                    views=article['views']
            
        except:
            print("No tiene página de Wikipedia\n--------------------")
            continue
            
        print("Nació el "+result1["answer"])
        print("Su profesión es "+result2["answer"])
        print("Su popularidad ayer fue de: "+str(views)+" visitas en wikipedia español.")

        print("--------------------")