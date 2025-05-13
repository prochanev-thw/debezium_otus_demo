import psycopg2
import random
import time
from datetime import datetime
from faker import Faker

# Настройки подключения
DB_HOST = "localhost"
DB_PORT = 5432
DB_NAME = "postgres"
DB_USER = "user"
DB_PASSWORD = "user"

GENERATE_N_ROWS = 10000

# Подготовка генератора данных
fake = Faker('ru_RU')

def generate_rows(n=1000):
    rows = []
    for _ in range(n):
        name = fake.name()
        age = random.randint(18, 65)
        rows.append((name, age))
    return rows

def insert_data():
    conn = psycopg2.connect(
        host=DB_HOST,
        port=DB_PORT,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    cursor = conn.cursor()

    try:
        while True:
            data = generate_rows(GENERATE_N_ROWS)
            args_str = ','.join(cursor.mogrify("(%s,%s)", x).decode("utf-8") for x in data)
            cursor.execute("INSERT INTO example_table (name, age) VALUES " + args_str)
            conn.commit()
            print(f"[{datetime.now()}] Inserted {GENERATE_N_ROWS} rows")
            time.sleep(5)
    except KeyboardInterrupt:
        print("Stopped by user")
    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    insert_data()
