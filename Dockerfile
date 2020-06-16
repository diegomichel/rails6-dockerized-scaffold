FROM ruby:2.6.4-alpine3.9

RUN apk update
RUN apk upgrade

RUN apk add --no-cache \
    bash git vim openssh openssl yarn sudo su-exec shadow tzdata \
    postgresql-client postgresql-dev sqlite sqlite-dev sqlite-libs\
    build-base libxml2-dev libxslt-dev

ARG GOSU_VERSION=1.7
ENV GOSU_VERSION $GOSU_VERSION
ARG GOSU_DOWNLOAD_URL=https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64
ENV GOSU_DOWNLOAD_URL ${GOSU_DOWNLOAD_URL}

RUN apk add --update curl
RUN curl -o /usr/local/bin/gosu -sSL ${GOSU_DOWNLOAD_URL} && \
    chmod +x /usr/local/bin/gosu

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY entrypoint /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]

#ADD Gemfile* $APP_HOME/
#RUN bundle install

#ADD . $APP_HOME
