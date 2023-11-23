FROM debian:bullseye

RUN mkdir /app
WORKDIR /app

RUN	apt update && apt install -y nodejs npm
RUN npm install axios
RUN npm install node-fetch@2

COPY ./index.html /app
COPY ./site.js /app

CMD ["node", "/app/site.js"]


