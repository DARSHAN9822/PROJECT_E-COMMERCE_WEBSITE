import mysql.connector
from mysql.connector import Error

def connect_to_db():
    try:
        connection = mysql.connector.connect(
            host='localhost', 
            database='E_COMMERCE_DB', 
            user='darshan', 
            password='mypassword' 
        )
        if connection.is_connected():
            print("Connected to the database")
            return connection
    except Error as e:
        print(f"Error while connecting to the database: {e}")
        return None

def fetch_monthly_sales_report(connection):
    try:
        cursor = connection.cursor(dictionary=True)
        query = """
        SELECT 
            DATE_FORMAT(o.order_date, '%Y-%m') AS month, 
            SUM(oi.quantity * oi.price) AS total_sales
        FROM Orders o
        JOIN Order_Items oi ON o.order_id = oi.order_id
        GROUP BY month
        ORDER BY month;
        """
        cursor.execute(query)
        results = cursor.fetchall()

        print("Monthly Sales Report")
        print("---------------------")
        for row in results:
            print(f"Month: {row['month']}, Total Sales: ${row['total_sales']:.2f}")
    except Error as e:
        print(f"Error fetching monthly sales report: {e}")
    finally:
        cursor.close()

def main():
    connection = connect_to_db()
    if connection:
        fetch_monthly_sales_report(connection)
        connection.close()

if __name__ == "__main__":
    main()
