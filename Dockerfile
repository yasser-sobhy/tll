# syntax=docker/dockerfile:1
FROM ruby:3.2.2-slim

# OS Level Dependencies
RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips \
    curl \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install bundler
RUN gem install rails

WORKDIR /usr/src/app
COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]