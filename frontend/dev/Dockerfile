FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install && \
    npm install -g react-scripts dotenv-cli web-vitals

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]