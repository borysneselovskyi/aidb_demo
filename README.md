In this demo we will install and use the EDB AIDB extension to build a simple RAG (Retrieval Augmented Generation) application in Postgres.
The aidb extension is now in technical pre-release status - this collection of scripts automates the installation of the aidb extension and the execution of the demo.
All steps are described in the EDB documentation: https://www.enterprisedb.com/docs/edb-postgres-ai/ai-ml/

This demo has been developed for MacOS.
You will need to have docker installed and two tokens:
1. EDB token to download EDB software from EDB repository
2. OPENAI_API_KEY - key so that you can use the OpenAI embeddings. 

First, the EDB software token and the OpenAI key are added to the variables in the 01_setup.sh script:

export EDB_REPO_TOKEN="<add your EDB Repo Token>"

export OPENAI_API_KEY="<add your OPENAI API Key>"

Install and start the docker container with the PostgreSQL instance with the aidb extension:

./01_setup.sh

The script will launch the docker application, pull the docker image from the EDB repository, and install the docker container with the aidb extension.


If the prompt reappears after the script has run, the Docker container is still being initialised in the background. Please check the status of the installation by running the 02_check_setup.sh script. Full initialisation can take up to 10 minutes.

When you see the following lines in the output

...

it means that the container installation is complete.
Please stop the execution of the script 02_check_setup.sh with the key combination <CTRL + C>.

Now we can test the connection to postgres by executing of 05_check_connection.sh:

./05_check_connection.sh

Run the demo - please use the "Enter" key to proceed to the next step of the demo:

./03_demo.sh


To cleanup the demo - stop and removethe docker container and stop the docker app, use the script:

./04_clean.sh
