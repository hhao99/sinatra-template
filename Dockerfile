FROM ruby:3.2.2-slim
RUN apt-get update -qq && apt-get install -y build-essential nodejs ruby-dev 
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
RUN bundle install
COPY . /myapp