FROM node:latest as node
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY ./ /app/
RUN npm run build

FROM nginx:latest
COPY --from=node /app/dist/frontend /usr/share/nginx/html