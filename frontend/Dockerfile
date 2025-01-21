FROM node:20-alpine as build

WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install -g dotenv-cli

COPY . .
RUN npm run build

FROM node:20-alpine as production
WORKDIR /app

COPY --from=build /app/build ./build

RUN npm install -g serve

ENV NODE_ENV=production
ENV PORT=3000
ENV HOST=0.0.0.0

CMD ["serve", "-s", "build", "-l", "3000"]