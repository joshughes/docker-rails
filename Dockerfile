FROM ruby:2.1.5-wheezy

RUN curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get update && \
    apt-get install -y nodejs imagemagick nginx

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/

RUN bundle install -j4 --system

ADD . /usr/src/app

CMD ["make", "test"]
