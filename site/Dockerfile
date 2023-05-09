FROM node:18-alpine3.17

WORKDIR /app

COPY package*.json /

#RUN npm install -g npm@8.0.0

ADD . .

RUN npm i

EXPOSE 5173

CMD ["npm", "run", "dev"]