import mysql.connector
import argparse
from tabulate import tabulate


def connect_to_db():
    return mysql.connector.connect(
        host="localhost",
        user="darshan",  
        password="mypassword",  
        database="E_COMMERCE_DB"
    )


def add_product():
    product_name = input("Enter product name: ")
    price = float(input("Enter price of the product: "))
    quantity = int(input("Enter quantity of the product: "))
    category_id = int(input("Enter category ID: "))

    connection = connect_to_db()
    cursor = connection.cursor()

    try:
        cursor.execute(
            "INSERT INTO Products (product_name, price, stock, category_id) VALUES (%s, %s, %s, %s)",
            (product_name, price, quantity, category_id)
        )
        connection.commit()
        print(f"Product '{product_name}' added successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.close()

def list_products():
    connection = connect_to_db()
    cursor = connection.cursor()

    try:
        cursor.execute("SELECT * FROM Products")
        products = cursor.fetchall()
        if products:
            headers = ["Product ID", "Product Name", "Price", "Stock", "Category ID"]
            print(tabulate(products, headers=headers, tablefmt="grid"))
        else:
            print("No products found.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.close()


def update_products(args):
    connection = connect_to_db()
    cursor = connection.cursor()

    try:
        updates = []
        params = []

        if args.name:
            updates.append("product_name = %s")
            params.append(args.name)
        if args.price is not None:
            updates.append("price = %s")
            params.append(args.price)
        if args.quantity is not None:
            updates.append("stock = %s")
            params.append(args.quantity)
        if args.category is not None:
            updates.append("category_id = %s")
            params.append(args.category)

        if updates:
            query = f"UPDATE Products SET {', '.join(updates)} WHERE product_id = %s"
            params.append(args.id)
            cursor.execute(query, params)
            connection.commit()
            print(f"Product with ID {args.id} updated successfully!")
        else:
            print("No fields provided to update.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.close()


def delete_product(args):
    connection = connect_to_db()
    cursor = connection.cursor()

    try:
        # Prepare the delete query
        query = "DELETE FROM Products WHERE product_id = %s"
        cursor.execute(query, (args.id,))
        connection.commit()

        # Check if any rows were affected (i.e., if the product was deleted)
        if cursor.rowcount > 0:
            print(f"Product with ID {args.id} deleted successfully!")
        else:
            print(f"No product found with ID {args.id}.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Admin tool for managing e-commerce database.")
    subparsers = parser.add_subparsers(dest="command", help="Available commands")

    add_product_parser = subparsers.add_parser("add_product", help="Add a new product to the database")

    list_product_parser = subparsers.add_parser("list_products",help =("List and display all products."))
    

    update_products_parser = subparsers.add_parser("update_products", help="Update an existing product in the database")
    update_products_parser.add_argument("--id", type=int, required=True, help="Product ID to update")
    update_products_parser.add_argument("--name", type=str, help="New product name")
    update_products_parser.add_argument("--price", type=float, help="New price")
    update_products_parser.add_argument("--quantity", type=int, help="New stock quantity")
    update_products_parser.add_argument("--category", type=int, help="New category ID")

    delete_product_parser = subparsers.add_parser("delete_product", help="Delete a product from the database")
    delete_product_parser.add_argument("--id", type=int, required=True, help="Product ID to delete")



    args = parser.parse_args()

    if args.command == "add_product":
        add_product()
    elif args.command == "list_products":
        list_products()
    elif args.command == "update_products":
        update_products(args)
    elif args.command == "delete_product":
        delete_product(args)       
    else:
        print("Invalid command. Use --help for available commands.")

