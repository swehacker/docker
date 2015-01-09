#!/bin/bash

# Setup Database
docker run -i -t -d -p 3306:3306 --name sonar-database swehacker/sonar-database

# Setup Server
docker run -i -t -d --name sonar-server -p 9000:9000 --link sonar-database:db swehacker/sonar-server
