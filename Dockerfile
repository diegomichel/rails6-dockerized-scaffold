FROM ruby:2.6.4-alpine3.9

RUN apk update
RUN apk upgrade

RUN apk add --no-cache \
    bash git vim openssh openssl yarn sudo su-exec shadow tzdata \
    postgresql-client postgresql-dev sqlite sqlite-dev sqlite-libs\
    build-base libxml2-dev libxslt-dev

# RUN gem install rails it's better to install it with docker-container

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

#ADD Gemfile* $APP_HOME/
#RUN bundle install

#ADD . $APP_HOME
