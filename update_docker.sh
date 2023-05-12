#!/bin/bash

docker stop $(docker ps -a -q)

#docker rm -f $(docker ps -a -q)
docker rm -f aws_db_test_container

docker build -t aws-db-test .

# Run the Docker container
#docker run -p 5000:5000 -e FLASK_ENV=development --name aws_db_test_container aws-db-test
#docker run -d -p 5000:5000 -e FLASK_ENV=development -v ${PWD}/db:/app/db -e DATABASE_URI=sqlite:////app/db/users.db --name aws_db_test_container aws-db-test
docker run -d -p 5000:5000 -e FLASK_ENV=development -v ${PWD}/db:/app/db -e DATABASE_URI=sqlite:////app/db/users.db -e CREATE_TABLES=1 --name aws_db_test_container aws-db-test


# Wait for the container to start
#sleep 5

# Run the 'flask database create-tables' command inside the container
docker exec -it aws_db_test_container flask database create-tables

# Output the container logs
docker logs -f aws_db_test_container


        