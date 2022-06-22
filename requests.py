import mariadb
import sys

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

#Pregunta A
print("¿Cuántas noticias fueron publicadas por cada medio de prensa?")
queryA = "SELECT medios.nombre,count(*) FROM noticias JOIN medios ON medios.id=id_medios GROUP BY nombre;"
cur.execute(queryA)

for row in cur:
    print(row)

#Pregunta B
dia = "2022-06-06"
print(f"\n¿Quienes son las personas mencionadas en las noticias de un día específico? ({dia})")
queryB = f"SELECT personas.nombre FROM mencionar JOIN noticias ON noticias.id = id_noticias JOIN personas ON personas.id = id_personas WHERE noticias.fecha = '{dia}' GROUP BY personas.nombre;"
cur.execute(queryB)

for row in cur:
    print(row)

#Pregunta C
persona = "Jaime Prota"
print(f"\n¿Cómo evoluciona la popularidad de una persona específica? ({persona})")
queryC = f"SELECT fecha, visitas FROM popularidad JOIN personas ON personas.id = id_personas WHERE personas.nombre = '{persona}' ORDER BY fecha;"
cur.execute(queryC)

for row in cur:
    print(row)

#Pregunta D
region = "Los Lagos"
print(f"\n¿Cuáles son los 5 medios de prensa más antiguos en una región especifica? ({region})")
queryD = f"SELECT nombre, fecha FROM medios WHERE region = '{region}' ORDER BY fecha LIMIT 5;"
cur.execute(queryD)

for row in cur:
    print(row)
