from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash import BashOperator

default_args = {
    "owner": "sarasitha",
    "retries": 1,
    "retry_delay": timedelta(minutes=5),
}

with DAG(
    dag_id="dbt_sales_analytics_pipeline",
    default_args=default_args,
    description="Run dbt models and tests for the Sales Analytics Pipeline",
    start_date=datetime(2026, 1, 1),
    schedule="@daily",
    catchup=False,
) as dag:

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command="cd /opt/airflow/sales_analytics_dbt && dbt run",
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command="cd /opt/airflow/sales_analytics_dbt && dbt test",
    )

    dbt_run >> dbt_test