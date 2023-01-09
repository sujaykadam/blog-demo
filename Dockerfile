FROM node:gallium-alpine3.17

RUN mkdir -p /blog
WORKDIR /blog

RUN apk update && apk upgrade
RUN apk add git

COPY . /blog

RUN yarn install
RUN yarn build

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "yarn", "start" ]