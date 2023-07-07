import pandas as pd
from sqlalchemy import create_engine, text

excel_file_path = "/Users/German_Varanytsya/Desktop/basilhayek-drug-indications-database/drug_indications_database.xlsx"

db_username = 'postgres'
db_password = 'postgres'
db_host = 'localhost'
db_port = '5432'
db_name = 'postgres'

df = pd.read_excel(excel_file_path)
print('Import data from Excel file to stage.drug_indications_database table')

engine = create_engine(f'postgresql://{db_username}:{db_password}@{db_host}:{db_port}/{db_name}')
print('Connected to database')

df.to_sql("drug_indications_database", engine, schema="stage", if_exists="replace", index=False)
print('Insert data into stage.drug_indications_database')

with engine.connect() as connection:
    connection.execute(text("CALL stage.sp_d_cas()"))
    print('CALL stage.sp_d_cas()')
    connection.execute(text("CALL stage.sp_d_chebi()"))
    print('CALL stage.sp_d_chebi()')
    connection.execute(text("CALL stage.sp_d_chemid()"))
    print('CALL stage.sp_d_chemid()')
    connection.execute(text("CALL stage.sp_d_ctd()"))
    print('CALL stage.sp_d_ctd()')
    connection.execute(text("CALL stage.sp_d_umls()"))
    print('CALL stage.sp_d_umls()')
    connection.execute(text("CALL stage.sp_i_subtype()"))
    print('CALL stage.sp_i_subtype()')
    connection.execute(text("CALL stage.sp_i_umls()"))
    print('CALL stage.sp_i_umls()')
    connection.execute(text("CALL stage.sp_i_umls_in()"))
    print('CALL stage.sp_i_umls_in()')

print('Success')