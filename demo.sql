\! echo "\nDatabase version and details\n"
select version();

\! read -p "..."
\! echo "\nInstalled extensions\n"
\dx

\! read -p "Install extension aidb"
\! echo "\ncreate extension aidb cascade;\n"
-- create extension aidb cascade;

\! read -p "..."
\! echo "\nInstalled extensions\n"
\dx

\! read -p "..."
\! echo "\nDemo to show the similarity search by using the text-embeddings-3-small open encoder model from HuggingFace\n"

\! echo "\nWe will create the table products\n"
\! echo "\nCREATE TABLE products ("
\! echo "   product_id SERIAL PRIMARY KEY,"
\! echo "   product_name TEXT NOT NULL,"
\! echo "   description TEXT,"
\! echo "   last_updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP"
\! echo ");\n"

CREATE TABLE products (product_id SERIAL PRIMARY KEY,product_name TEXT NOT NULL,description TEXT,last_updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);

\! read -p "..."
\! echo "\nNow lets create the retriever with the just created products table as source\n"
\! echo "\nSELECT aidb.create_pg_retriever("
\! echo "    'product_embeddings_auto', -- Retriever name"
\! echo "    'public', -- Schema"
\! echo "    'product_id', -- Primary key"
\! echo "    'all-MiniLM-L6-v2', -- embedding model"
\! echo "    'text', -- data type"
\! echo "    'products', -- Source table"
\! echo "    ARRAY['product_name', 'description'], -- Columns to vectorize"
\! echo "    TRUE -- auto embeddings TRUE to set trigger"
\! echo "\n);"

SELECT aidb.create_pg_retriever('product_embeddings_auto','public','product_id','all-MiniLM-L6-v2','text','products',ARRAY['product_name', 'description'],TRUE);

\! read -p "..."
\! echo "\nCheck installed retriever\n"
\! echo \n"select * from aidb.retrievers;\n"

\x
select * from aidb.retrievers;

\! read -p "..."
-- \! clear
\! echo "\nInsert data into table products\n"
\! echo "\nINSERT INTO products (product_name, description) VALUES"
\! echo "      ('Hamburger', 'Tasty'),"
\! echo "      ('Cheesburger', 'Very tasty'),"
\! echo "      ('Fish n Chips', 'Naa'),"
\! echo "      ('Fries', 'Dunno'),"
\! echo "      ('Burrito', 'Always'),"
\! echo "      ('Pizza', 'Mkay'),"
\! echo "      ('Sandwich', 'So what'),"
\! echo "      ('Veggie Burger', 'Go away'),"
\! echo "      ('Kebab', 'Maybe');\n"

INSERT INTO products (product_name, description) VALUES('Hamburger', 'Tasty'),('Cheesburger', 'Very tasty'),('Fish n Chips', 'Naa'),('Fries', 'Dunno'),('Burrito', 'Always'),('Pizza', 'Mkay'),('Sandwich', 'So what'),('Veggie Burger', 'Go away'),('Kebab', 'Maybe');

\! read -p "..."
\! echo "\nQuery table products\n"
\! echo "\nselect * from products;\n"

\x
select * from products;

\! echo "\n$Now you can use the retriever, by specifying the retriever name," 
\! echo "to perform a similarity retrieval of the top K most relevant, in this case most similar, AI data items\n"

\! read -p "..."
\! echo "\nSELECT data FROM aidb.retrieve("
\! echo "'I like it', -- The query text to retrieve the top similar data" 
\! echo "5, -- top K"
\! echo "'product_embeddings_auto' -- retriever's name"
\! echo ");\n"

select data FROM aidb.retrieve('I like it',5,'product_embeddings_auto');

\! echo "\nShow available encoders:\n"
\! read -p "..."
\! echo "select * form aidb.encoders;"

select * FROM aidb.encoders;

\! read -p "Demo is finished"
