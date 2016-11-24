FROM ruby:2.2

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
ADD vendor/cache /app/vendor/cache
RUN bundle install --local --without development test

ADD . /app

EXPOSE 5000
