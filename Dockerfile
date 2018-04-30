FROM ruby:2.4-alpine3.6
RUN apk add --update \
    build-base \
    mariadb-dev \
    sqlite-dev \
    nodejs \
    tzdata \
    imagemagick
ADD . /spree
ENV SPREE_DATABASE_URL='' 
ENV SPREE_DATABASE_DEV=''
ENV SPREE_DATABASE_PROD=''
ENV SPREE_DATABASE_USER='' 
ENV SPREE_DATABASE_PASSWORD='' 
ENV SECRET_KEY_BASE=''
ENV RAILS_ENV='development'
ENV AUTO_ACCEPT='1'
WORKDIR /spree
RUN gem install bundler
RUN bundle install
EXPOSE 3000
ENTRYPOINT rails server
