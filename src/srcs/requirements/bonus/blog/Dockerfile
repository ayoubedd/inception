FROM alpine:3.17.3 as BUILD

RUN apk update && apk upgrade
RUN apk add nodejs npm git

WORKDIR /app
RUN git clone --recurse-submodules https://github.com/ayoubedd/website.git .
RUN npm i
RUN npm run build

FROM alpine:3.17.3 as PROD
RUN apk update && apk upgrade
RUN apk add nginx

COPY --from=BUILD /app/dist /var/www/html/
COPY conf/ /etc/nginx/

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
