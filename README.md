# E-Commerce Data Pipeline: dbt, Snowflake, Airflow

## Overview
A data engineering pipeline for e-commerce sales data. Ingests CSV files, transforms data with dbt, and orchestrates tasks with Airflow, storing results in Snowflake.

## Tech Stack
- **dbt Core** (1.9.4): Data transformation
- **Snowflake**: Cloud data warehouse
- **Apache Airflow** (2.10.2): Workflow orchestration
- **Python** (3.12): Scripting

## Project Structure
```
ECommerce-project/
├── data/                # Input CSVs
├── dbt/ecom_dbt/        # dbt models, tests, config
├── airflow/dags/         # Airflow DAG (ecom_pipeline.py)
├── README.md            # Documentation
```

## Data Lineage
![Data Lineage](/photos/DataLineage.png)

## Setup & Installation

### Set Up Virtual Environment
```bash
python3 -m venv ecom_venv
source ecom_venv/bin/activate
pip install apache-airflow==2.10.2 snowflake-connector-python==3.12.2 dbt-core==1.9.4 dbt-snowflake==1.9.4
```

### Configure Snowflake
Create database and schema:
```sql
CREATE DATABASE ECOMMERCE_DB;
CREATE SCHEMA ECOMMERCE_DB.RAW;
CREATE STAGE ECOMMERCE_DB.RAW.ecom_stage;
CREATE TABLE ECOMMERCE_DB.RAW.raw_sales (InvoiceNo STRING, StockCode STRING, Description STRING, Quantity INT, InvoiceDate STRING, UnitPrice FLOAT, CustomerID STRING);
GRANT ALL ON DATABASE ECOMMERCE_DB TO ROLE ACCOUNTADMIN;
```

### Configure dbt
Update `~/.dbt/profiles.yml`:
```yaml
ecom_dbt:
  outputs:
    dev:
      account: md61989.us-central1.gcp
      database: ECOMMERCE_DB
      user: dbt_user
      password: dpt_password
      warehouse: ECOMMERCE_WH
      role: ACCOUNTADMIN
      schema: RAW
      type: snowflake
  target: dev
```

### Set Up Airflow
```bash
export AIRFLOW_HOME=~/ECommerce-project/airflow
airflow db init
airflow users create -u admin -f Admin -l User -r Admin -e admin@example.com -p admin
```

## Run Pipeline
1. Add `test_retail.csv` to `data/`.
2. Start Airflow:
   ```bash
   source ecom_venv/bin/activate
   airflow scheduler
   airflow webserver -p 8080
   ```
3. Trigger `ecom_pipeline` in UI (`http://localhost:8080`).
![airflow](/photos/airflow11.png)
4. Verify:
   ```sql
   SELECT * FROM ECOMMERCE_DB.RAW.fact_sales LIMIT 5;
   ```
