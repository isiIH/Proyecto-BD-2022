import os
user = "root"
db = "medios_de_prensa"
os.system(f"mysqldump -u {user} -p {db} > medios_de_prensa.sql")