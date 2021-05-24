FROM node:alpine

RUN mkdir /react-frontend

WORKDIR /react-frontend

COPY package.json /.
RUN npm install

COPY . .

RUN npm run build

FROM nginx
COPY --from=0 /react-frontend/build /usr/share/nginx/html
#We need not have to mentioned start nginx, it will be started automatically, taken care by nginx. 

#to host static content we need to copy all the build content into /usr/share/nginx/html location of nginx
