from elasticsearch import Elasticsearch
import psycopg2

es_host = 'localhost'
es_port = 9200
es_index = 'my_index'
db_username = 'postgres'
db_password = 'postgres'
db_host = 'localhost'
db_port = '5432'
db_name = 'postgres'
db_schema = 'integrated'
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
    Print('Connect to PostgreSQL')
    conn = psycopg2.connect(
        user=db_username,
        password=db_password,
        host=db_host,
        port=db_port,
        database=db_name
    )
    cursor = conn.cursor()

    cursor.execute(f"SELECT table_name, column_name FROM information_schema.columns WHERE table_schema='{db_schema}' and table_name ='{db_table}'")
    columns = cursor.fetchall()

    for table, column in columns:
        print('Retrieve data from PostgreSQL')
        cursor.execute(f"SELECT {column} FROM {db_schema}.{table} LIMIT 100")
        rows = cursor.fetchall()

        print('Index data into Elasticsearch')
        for row in rows:
            document = {
                'table_name': table,
                'column_name': column,
                'value': row[0]
            }
            es.index(index=es_index, body=document)

    Print('Close connections')
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

es = Elasticsearch([{'host': es_host, 'port': es_port, 'scheme': 'http'}])

create_index_mapping(es)

index_data(es)

search_result = search_value(es, '1972')

for hit in search_result['hits']['hits']:
    table_name = hit['_source']['table_name']
    column_name = hit['_source']['column_name']
    value = hit['_source']['value']
    print(f"Table: {table_name}, Column: {column_name}, Value: {value}")
