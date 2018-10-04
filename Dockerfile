FROM ruby:2.4.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /quantified_self
WORKDIR /quantified_self

COPY Gemfile /quantified_self/Gemfile
COPY Gemfile.lock /quantified_self/Gemfile.lock

RUN bundle install

COPY . /quantified_self