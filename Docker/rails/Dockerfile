FROM ruby:2.6.3

RUN apt-get update -qq && \
	apt-get install -y apt-utils \
	build-essential\
	libpq-dev\
	nodejs \
	default-mysql-client \

RUN mikdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD. /app
EXPOSE 3000
RUN bundle install


