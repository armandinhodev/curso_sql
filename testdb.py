

from sqlalchemy import create_engine, text

USER = "postgres"
PASS = "12345678"
HOST = "localhost"
PORT = "5432"
DB   = "sistema_ventas"


url_conexion = f"postgresql+psycopg://{USER}:{PASS}@{HOST}:{PORT}/{DB}"


engine = create_engine(url_conexion)

with engine.connect() as conn:
    
    query = text("SELECT * FROM productos")
    
    result = conn.execute(query)
    
    for producto in result:
        
        print(producto.nombre)


'''
conn = engine.connect()

try:

    query = text("SELECT * FROM productos")
    

    resultado = conn.execute(query)
    
    for producto in resultado:
        
        print(f"Nombre: {producto.nombre} | Precio: {producto.precio}")

except Exception as e:
    print(f"Error al consultar la base de datos: {e}")

finally:

    conn.close()
'''


'''

import os
from dotenv import load_dotenv 
load_dotenv()

pip install sqlalchemy psycopg[binary]
pip install python-dotenv

'''