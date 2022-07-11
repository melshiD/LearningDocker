
# >docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback feedback:vols 
# docker run -d -p 3000:80 --name feedbackApp -v feedback:/app/feedback -v "C:/Users/davem/Coding/docker_learning_docker/data-volumes-03-adj-node-code:/app" feedback:vols 
# docker run -d -p 3000:80 --name feedbackApp -v feedback:/app/feedback -v "C:/Users/davem/Coding/docker_learning_docker/data-volumes-03-adj-node-code:/app" -v /app/node_modules feedback:app /
# or we could add anonymous volume for node_modules in the dockerfile, see above eventually:  VOLUME ["/app/node_modules"]

C:\Users\davem\Coding\docker_learning_docker\data-volumes-03-adj-node-code>docker run -p 3000:80 --rm -d 
--name feedbackApp -v /app/node_modules -v /app/temp -v "C:/Users/davem/Coding/docker_learning_docker/data-volumes-03-adj-node-code:/app:ro" -v feedback:/app/feedback feedback:app
8a44d4f8823c5c77d0317f0f73b327e819eeacc6606b88ca4e3c3f1ec2126698

Follows is a command run a container and make it part of the newtork we set up (favorites-net) to
expose the mongodb container to the api in the favorites container we're about to run.  Later
see how the IP routing is done inside the api when connecting to the database (host.docker.internal 
vs. using container name when part of a --network (vs. manually looking up container IP with 
docker container inspect [name])):
>docker run --network favorites-net -d --name favorites --rm -p 3000:3000 favorites:node

When dockerizing the front end, I was getting an error about such-and-such not a function from index.js,
so adding .package-lock.json to a .dockerignore file didnt work, but adding a COPY package-lock.json to the
dockerfile and rebuilding the image ended up working

```` Here is how I added a user to Mongo in an attempt to get the login credentials to work" ```
from the community:
It seems environment variables were not respected by mongoDb on my linux host, to resolve this issue, I had to create mongoDb User by following these steps, posting it here so it might help someone:

1. Jump into your dockerized MongoDB container with

docker exec -it <mongo-container-name or mongo-container-id> bash

2. Connect to mongodb/mongod service locally inside your docker container with

mongo 127.0.0.1

3. Inside the mongo shell in the mongodb container, jump to the admin database with

use admin

4. Use following command

db.createUser({user:"deepak", pwd: "example", roles: [{role: "userAdminAnyDatabase", db: "admin"}]})

Now you should be able to connect to mongoDb from backend container.
