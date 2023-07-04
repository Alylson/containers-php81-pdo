FROM node:18-alpine3.17

WORKDIR /app

# Copy files as a non-root user. The `node` user is built in the Node image.
RUN chown node:node ./
USER node

COPY package*.json /

#RUN npm install -g npm@8.0.0

ADD . .

RUN npm i

EXPOSE 5173

CMD ["npm", "run", "dev"]