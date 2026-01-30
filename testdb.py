from dotenv import load_dotenv 
from sqlalchemy import create_engine, text
import os

load_dotenv()


USER = os.getenv('USER')
PASS = os.getenv('PASS')
HOST = os.getenv('HOST')
PORT = os.getenv('PORT')
DB   = os.getenv('DB')


url_conexion = f"postgresql+psycopg://{USER}:{PASS}@{HOST}:{PORT}/{DB}"

engine = create_engine(url_conexion)

sql = "SELECT * FROM productos"

with engine.connect() as conn:
    
    query = text(sql)
    
    result = conn.execute(query)
    
    for stock in result:
        
        print(stock.categoria, stock.stock_total)




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