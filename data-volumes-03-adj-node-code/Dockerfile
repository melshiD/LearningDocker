FROM node:14

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# VOLUME ["/app/node_modules"]

EXPOSE 80

CMD [ "npm", "start" ]

#>docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback feedback:vols 
# docker run -d -p 3000:80 --name feedbackApp -v feedback:/app/feedback -v "C:/Users/davem/Coding/docker_learning_docker/data-volumes-03-adj-node-code:/app" feedback:vols 
# docker run -d -p 3000:80 --name feedbackApp -v feedback:/app/feedback -v "C:/Users/davem/Coding/docker_learning_docker/data-volumes-03-adj-node-code:/app" -v /app/node_modules feedback:vols /
#or we could add anonymous volume for node_modules in the dockerfile, see above eventually:  VOLUME ["/app/node_modules"]