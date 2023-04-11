FROM node:16-alpine AS build

WORKDIR /app

RUN chmod -R 755 /app

COPY package.json /app

RUN npm install

COPY . .

FROM nginx AS runner

WORKDIR /usr/share/nginx/html

COPY --from=build /app/dist/ /usr/share/nginx/html

EXPOSE 80

