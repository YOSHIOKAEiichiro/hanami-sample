FROM ruby:2.6.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs sqlite3
WORKDIR /app
RUN gem install hanami
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN echo 'gem: --no-document' > ~/.gemrc \
  && bundle install
ADD . /app

