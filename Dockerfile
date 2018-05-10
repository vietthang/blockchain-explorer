FROM node:8

WORKDIR /app

COPY . /app/blockchain-explorer

WORKDIR /app/blockchain-explorer

RUN npm install

WORKDIR /app/blockchain-explorer/app/test

RUN npm install

RUN npm run test

WORKDIR /app/blockchain-explorer/client

RUN npm install

RUN npm test -- -u --coverage

RUN npm run build

WORKDIR /app/blockchain-explorer

CMD [ "node", "main.js" ]