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
query = "DESCRIBE noticias"
cur.execute(query)

for row in cur:
    print(row)