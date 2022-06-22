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

#Noticias
cur.execute("INSERT INTO noticias (url, titulo, fecha, contenido) VALUES ('https://www.lipsum.com/', 'Lorem', CURDATE(), 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam')")
cur.execute("INSERT INTO noticias (url, titulo, fecha, contenido) VALUES ('https://www.google.com/', 'Google', CURDATE(), 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum')")
cur.execute("INSERT INTO noticias (url, titulo, fecha, contenido) VALUES ('https://www.youtube.com/', 'Youtube', CURDATE(), 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur')")

#Medios
cur.execute("INSERT INTO medios (nombre, url, region, pais, fecha, tipo, idioma, id_noticias) VALUES ('EL MERCURIO','https://www.emol.com/','OHiggins','Chile',CURDATE(),'regional','español',1)")
cur.execute("INSERT INTO medios (nombre, url, region, pais, fecha, tipo, idioma, id_noticias) VALUES ('LA TERCERA','https://www.latercera.com/','OHiggins','Chile',CURDATE(),'local','español',2)")
cur.execute("INSERT INTO medios (nombre, url, region, pais, fecha, tipo, idioma, id_noticias) VALUES ('LAS ÚLTIMAS NOTICIAS','www.lun.com','OHiggins','Chile',CURDATE(),'local','español',3)")

#Propietario
cur.execute("INSERT INTO propietario (nombre, persona) VALUES ('Luis','Natural')")
cur.execute("INSERT INTO propietario (nombre, persona) VALUES ('Nayeli','Empresa')")

#Personas
cur.execute("INSERT INTO personas (nombre, wiki) VALUES ('Cristian',false)")
cur.execute("INSERT INTO personas (nombre, wiki, profesion, nacimiento, nacionalidad, popularidad) VALUES ('Jaime Prota',true, 'informático' ,CURDATE(),'Chilena',123)")

#Poseer
cur.execute("INSERT INTO poseer (fecha, id_medios, id_propietario) VALUES (CURDATE(), 1, 2)")
cur.execute("INSERT INTO poseer (fecha, id_medios, id_propietario) VALUES (CURDATE(), 2, 1)")

#Mencionar
cur.execute("INSERT INTO mencionar (id_noticias, id_medios) VALUES (1,3)")
cur.execute("INSERT INTO mencionar (id_noticias, id_medios) VALUES (2,1)")
cur.execute("INSERT INTO mencionar (id_noticias, id_medios) VALUES (3,2)")

conn.commit() 
conn.close()