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

#Medios
cur.execute("INSERT INTO medios (nombre, url, region, pais, fecha, tipo, idioma) VALUES ('EL MERCURIO','https://www.emol.com/','Los Lagos','Chile','2022-06-03','regional','español')")
cur.execute("INSERT INTO medios (nombre, url, region, pais, fecha, tipo, idioma) VALUES ('LA TERCERA','https://www.latercera.com/','Los Lagos','Chile','2022-06-04','local','español')")
cur.execute("INSERT INTO medios (nombre, url, region, pais, fecha, tipo, idioma) VALUES ('LAS ÚLTIMAS NOTICIAS','www.lun.com','OHiggins','Chile',CURDATE(),'local','español')")

#Noticias
cur.execute("INSERT INTO noticias (url, titulo, fecha, contenido,id_medios) VALUES ('https://www.lipsum.com/', 'Lorem', '2022-06-06', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 2)")
cur.execute("INSERT INTO noticias (url, titulo, fecha, contenido,id_medios) VALUES ('https://www.google.com/', 'Google', '2022-06-05', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',3)")
cur.execute("INSERT INTO noticias (url, titulo, fecha, contenido,id_medios) VALUES ('https://www.google.com/hola', 'sdjkahakjsdja', '2022-06-06', 'Excepteur sint occaecat cupidatat non proident, deserunt mollit anim id est laborum',1)")
cur.execute("INSERT INTO noticias (url, titulo, fecha, contenido,id_medios) VALUES ('https://www.youtube.com/', 'Youtube', '2022-06-02', 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',1)")

#Propietario
cur.execute("INSERT INTO propietario (nombre, persona) VALUES ('Luis','Natural')")
cur.execute("INSERT INTO propietario (nombre, persona) VALUES ('Nayeli','Empresa')")

#Personas
cur.execute("INSERT INTO personas (nombre, wiki) VALUES ('Cristian',false)")
cur.execute("INSERT INTO personas (nombre, wiki, profesion, nacimiento, nacionalidad) VALUES ('Llanca',true,'informatico','2022-06-08','Chilena')")
cur.execute("INSERT INTO personas (nombre, wiki, profesion, nacimiento, nacionalidad) VALUES ('Jaime Prota',true, 'informático' ,'2022-06-08','Chilena')")

#Popularidad
cur.execute("INSERT INTO popularidad (visitas, fecha, id_personas) VALUES (2389, CURDATE(), 3)")
cur.execute("INSERT INTO popularidad (visitas, fecha, id_personas) VALUES (13, '2022-06-13', 3)")
cur.execute("INSERT INTO popularidad (visitas, fecha, id_personas) VALUES (1782, '2022-06-14', 3)")
cur.execute("INSERT INTO popularidad (visitas, fecha, id_personas) VALUES (123, CURDATE(), 2)")

#Poseer
cur.execute("INSERT INTO poseer (fecha, id_medios, id_propietario) VALUES (CURDATE(), 1, 2)")
cur.execute("INSERT INTO poseer (fecha, id_medios, id_propietario) VALUES ('2022-06-07', 2, 1)")

#Mencionar
cur.execute("INSERT INTO mencionar (id_noticias, id_personas) VALUES (1,2)")
cur.execute("INSERT INTO mencionar (id_noticias, id_personas) VALUES (2,1)")
cur.execute("INSERT INTO mencionar (id_noticias, id_personas) VALUES (3,2)")
cur.execute("INSERT INTO mencionar (id_noticias, id_personas) VALUES (4,2)")



conn.commit() 
conn.close()