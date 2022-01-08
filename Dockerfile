FROM node:lts-alpine

#RUN npm -g i @vue/cli

#WORKDIR /app
#
#RUN npm i

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
CMD ["yarn", "serve", "--public=http://vue-docker.local", "--mode=docker", "--emoji=false", "--no-progress"]
