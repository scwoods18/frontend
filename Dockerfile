FROM node:latest as node
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY ./ /app/
RUN npm run build --prod

FROM nginx:alpine
COPY --from=node /app/dist/frontend /usr/share/nginx/html