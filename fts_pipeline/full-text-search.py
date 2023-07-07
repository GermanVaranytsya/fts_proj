from elasticsearch import Elasticsearch
import psycopg2

# Elasticsearch connection configuration
es_host = 'localhost'
es_port = 9200
es_index = 'my_index'  # Name of the Elasticsearch index where data will be stored

# PostgreSQL connection configuration
db_username = 'postgres'
db_password = 'postgres'
db_host = 'localhost'
db_port = '5432'
db_name = 'postgres'
db_schema = 'integrated'  # Schema name
db_table = 'i_umls'

# Function to create the Elasticsearch index mapping
def create_index_mapping(es):
    if not es.indices.exists(index=es_index):
        mapping = {
            'mappings': {
                'properties': {
                    'table_name': {'type': 'keyword'},
                    'column_name': {'type': 'keyword'},
                    'value': {'type': 'text'}
                }
            }
        }
        es.indices.create(index=es_index, body=mapping)

# Function to index data from PostgreSQL to Elasticsearch
def index_data(es):
    # Connect to PostgreSQL
    conn = psycopg2.connect(
        user=db_username,
        password=db_password,
        host=db_host,
        port=db_port,
        database=db_name
    )
    cursor = conn.cursor()

    # Retrieve table names and column names from PostgreSQL
    cursor.execute(f"SELECT table_name, column_name FROM information_schema.columns WHERE table_schema='{db_schema}' and table_name ='{db_table}'")
    columns = cursor.fetchall()

    # Iterate over tables and columns
    for table, column in columns:
        # Retrieve data from PostgreSQL
        cursor.execute(f"SELECT {column} FROM {db_schema}.{table} LIMIT 100")
        rows = cursor.fetchall()

        # Index data into Elasticsearch
        for row in rows:
            document = {
                'table_name': table,
                'column_name': column,
                'value': row[0]
            }
            es.index(index=es_index, body=document)

    # Close connections
    cursor.close()
    conn.close()

# Function to search for a specific value in Elasticsearch
def search_value(es, value):
    query = {
        'query': {
            'match': {
                'value': {'query': value}
            }
        }
    }
    result = es.search(index=es_index, body=query)
    return result

# Create the Elasticsearch client
es = Elasticsearch([{'host': es_host, 'port': es_port, 'scheme': 'http'}])

# Create the Elasticsearch index mapping (only needs to be done once)
create_index_mapping(es)

# Index data from PostgreSQL to Elasticsearch
index_data(es)

# Search for a specific value ('Popov' in this example)
search_result = search_value(es, '1972')

# Print the search results
for hit in search_result['hits']['hits']:
    table_name = hit['_source']['table_name']
    column_name = hit['_source']['column_name']
    value = hit['_source']['value']
    print(f"Table: {table_name}, Column: {column_name}, Value: {value}")
