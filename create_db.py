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

cur.execute("DROP DATABASE medios_de_prensa")
query_create = "CREATE DATABASE medios_de_prensa"
cur.execute(query_create)
cur.execute("USE medios_de_prensa")

# TABLA NOTICIAS
cur.execute("CREATE TABLE noticias (id INT NOT NULL AUTO_INCREMENT, url TEXT, titulo TEXT, fecha DATE, contenido TEXT, PRIMARY KEY(id))")
# TABLA MEDIOS DE PRENSA
cur.execute("CREATE TABLE medios (id INT NOT NULL AUTO_INCREMENT, nombre VARCHAR(255), url TEXT, region VARCHAR(255), pais VARCHAR(255), fecha DATE, tipo VARCHAR(10), idioma VARCHAR(255), id_noticias INT, FOREIGN KEY (id_noticias) REFERENCES noticias(id), PRIMARY KEY(id))")
# TABLA PROPIETARIO
cur.execute("CREATE TABLE propietario (id INT NOT NULL AUTO_INCREMENT, nombre VARCHAR(255), persona VARCHAR(10), PRIMARY KEY(id))")
# TABLA PERSONAS
cur.execute("CREATE TABLE personas (id INT NOT NULL AUTO_INCREMENT, nombre VARCHAR(255), wiki BOOL, profesion VARCHAR(255), nacimiento DATE, nacionalidad VARCHAR(255), popularidad INT(255), PRIMARY KEY(id))")
# TABLA POSEER
cur.execute("CREATE TABLE poseer (fecha DATE, id_medios INT NOT NULL, FOREIGN KEY (id_medios) REFERENCES medios(id), id_propietario INT NOT NULL, FOREIGN KEY (id_propietario) REFERENCES propietario(id), PRIMARY KEY(id_medios, id_propietario))")
# TABLA MENCIONAR
cur.execute("CREATE TABLE mencionar (id_noticias INT NOT NULL, FOREIGN KEY (id_noticias) REFERENCES noticias(id), id_medios INT NOT NULL, FOREIGN KEY (id_medios) REFERENCES medios(id), PRIMARY KEY(id_noticias, id_medios))")

conn.close()