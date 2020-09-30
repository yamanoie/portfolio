FROM ruby:2.5.7

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       vim

RUN mkdir /segurado!

WORKDIR /segurado!

ADD Gemfile /segurado!/Gemfile
ADD Gemfile.lock /segurado!/Gemfile.lock

RUN gem install bundler && bundle install 

ADD . /segurado!

RUN mkdir -p tmp/sockets