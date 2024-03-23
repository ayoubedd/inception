FROM alpine:3.17.3

RUN apk update && apk upgrade
RUN apk add nodejs npm git

RUN npm install pm2 -g && pm2 install pm2-logrotate

WORKDIR /app
RUN git clone https://github.com/louislam/uptime-kuma.git .
RUN npm run setup

EXPOSE 80

CMD [ "pm2-runtime", "server/server.js" ]
