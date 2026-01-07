
"""
FlexiMart ETL Pipeline - Part 1
"""

import pandas as pd
import numpy as np
import re
from datetime import datetime
import mysql.connector
import os

# =============================
# CONFIG
# =============================

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DATA_DIR = os.path.abspath(os.path.join(BASE_DIR, "..", "data"))

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "Farah@123",
    "database": "fleximart",
    "port": 3306
}

# =============================
# UTILS
# =============================

def clean_phone(phone):
    if pd.isna(phone):
        return None
    digits = re.sub(r"\D", "", str(phone))
    digits = digits[-10:]
    return f"+91-{digits}" if len(digits) == 10 else None


def clean_date(value):
    dt = pd.to_datetime(value, errors="coerce", dayfirst=False)
    return dt.date() if not pd.isna(dt) else None


def read_csv_safe(filename):
    path = os.path.join(DATA_DIR, filename)
    if not os.path.exists(path):
        raise FileNotFoundError(f"File not found: {path}")
    df = pd.read_csv(path)
    print(f"Loaded: {filename} ({len(df)} rows)")
    return df


def mysql_connect():
    return mysql.connector.connect(**DB_CONFIG)


# =============================
# TRANSFORMS
# =============================

def transform_customers(df):
    df = df.drop_duplicates()

    if "customer_id" in df.columns:
        df = df.drop(columns=["customer_id"])

    # Clean email column safely
    df["email"] = df["email"].astype(str)
    mask = df["email"].str.strip().isin(["", "nan", "None"])

    df.loc[mask, "email"] = (
        "unknown_" + df.loc[mask].index.astype(str) + "@email.com"
    )

    df["phone"] = df["phone"].apply(clean_phone)
    df["registration_date"] = df["registration_date"].apply(clean_date)
    df["city"] = df["city"].astype(str).str.title()

    return df


def transform_products(df):
    df = df.drop_duplicates()

    if "product_id" in df.columns:
        df = df.drop(columns=["product_id"])

    df["price"] = df["price"].fillna(df["price"].median())
    df["stock_quantity"] = df["stock_quantity"].fillna(0)
    df["category"] = df["category"].astype(str).str.strip().str.capitalize()

    return df


def transform_sales(df):
    df = df.drop_duplicates()

    # Rename column safely
    if "transaction_date" in df.columns:
        df = df.rename(columns={"transaction_date": "order_date"})

    df["order_date"] = df["order_date"].apply(clean_date)

    df["quantity"] = df["quantity"].fillna(0).astype(int)
    df["unit_price"] = df["unit_price"].fillna(0)

    df["total_amount"] = df["quantity"] * df["unit_price"]

    df = df.dropna(subset=["customer_id", "product_id", "order_date"])

    df = df.drop(columns=["unit_price", "status"])

    return df


# =============================
# LOAD
# =============================

def insert_data(df, table, columns):
    conn = mysql_connect()
    cursor = conn.cursor()

    placeholders = ",".join(["%s"] * len(columns))
    col_str = ",".join(columns)

    query = f"""
        INSERT IGNORE INTO {table} ({col_str})
        VALUES ({placeholders})
    """

    data = []
    for _, row in df.iterrows():
        values = []
        for col in columns:
            val = row[col]
            if pd.isna(val):
                values.append(None)
            else:
                values.append(val)
        data.append(tuple(values))

    cursor.executemany(query, data)
    conn.commit()

    print(f"Inserted into {table}: {cursor.rowcount} rows")

    cursor.close()
    conn.close()


# =============================
# MAIN
# =============================

if __name__ == "__main__":
    print("\nStarting FlexiMart ETL Pipeline...\n")

    customers = read_csv_safe("customers_raw.csv")
    products = read_csv_safe("products_raw.csv")
    sales = read_csv_safe("sales_raw.csv")

    customers = transform_customers(customers)
    products = transform_products(products)
    sales = transform_sales(sales)

    insert_data(
        customers,
        "customers",
        ["first_name", "last_name", "email", "phone", "city", "registration_date"]
    )

    insert_data(
        products,
        "products",
        ["product_name", "category", "price", "stock_quantity"]
    )

    insert_data(
        sales,
        "sales",
        ["customer_id", "product_id", "quantity", "order_date", "total_amount"]
    )

    print("\nETL Pipeline Completed Successfully.")
