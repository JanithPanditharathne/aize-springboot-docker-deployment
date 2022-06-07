# Stage 1
FROM node:14.7-alpine as build-step
RUN apk --no-cache --virtual build-dependencies add \
    python
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install -g @angular/cli@1.7.4 &&  npm install &&  npm install --unsafe-perm
COPY . /app
RUN npm run build --prod && apk del build-dependencies

# Stage 2
FROM nginx:1.17.1-alpine
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-step /app/dist /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]