# ETL-Retail-Insights

## Overview
This project demonstrates an end-to-end data analytics workflow:
1. Download retail orders dataset from Kaggle using Python API
2. Perform data cleaning and preprocessing with pandas
3. Load processed data into SQL Server
4. Execute SQL queries for business insights

The project focuses on analyzing sales data to uncover trends, top-performing products, and growth patterns across different regions and time periods.

## Steps in the Analysis

### 1. Extract
- Download dataset from Kaggle using Python API
- Extract CSV file from ZIP archive

### 2. Transform
- Handle missing values in 'ship_mode' column
- Standardize column names (lowercase with underscores)
- Create new calculated columns:
  - `discount` (exact discount amount)
  - `sale_price` (price after discount)
  - `profit` (sale price minus cost price)
- Convert 'order_date' to proper datetime format
- Remove unnecessary columns

### 3. Load
- Create SQL Server table with optimized data types
- Load processed data into SQL Server

####  Data Analysis (SQL Queries)
1. **Top 10 Revenue Generating Products**  
   Identify highest-grossing products based on total sales
    ![Screenshot (203)](https://github.com/user-attachments/assets/6f45eacb-d498-497a-b293-d8a22316cbb5)
   

3. **Top 5 Products per Region**  
   Find best-selling products in each geographical region
   ![Screenshot (205)](https://github.com/user-attachments/assets/888e7e4c-ce75-4fdc-87bc-e1a37f728a21)


5. **Month-over-Month Sales Comparison**  
   Compare monthly sales performance between 2022 and 2023
   ![Screenshot (206)](https://github.com/user-attachments/assets/27ef9349-8280-4ce5-b803-ceccddc7c910)


7. **Peak Sales Month by Category**  
   Determine highest-selling month for each product category
   ![Screenshot (207)](https://github.com/user-attachments/assets/17b25023-df03-4cf3-bed9-c0d8ace021ff)


9. **Subcategory Growth Analysis**  
   Identify subcategories with highest profit growth (2023 vs 2022)
   ![Screenshot (208)](https://github.com/user-attachments/assets/07328a91-74c6-4526-b1d6-4486f5e5325d)


## Technologies Used
- **Python** (pandas, kaggle API)
- **SQL Server** (Database management)
- **SQLAlchemy** (Python-SQL integration)
- **Jupyter Notebook** (Code execution environment)

## Setup Instructions

### Prerequisites
- Kaggle account 
- SQL Server installed
- Python 3.7+
- Anaconda 
