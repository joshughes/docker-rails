FROM ruby:2.1.5-wheezy

RUN curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get update && \
    apt-get install -y nodejs imagemagick nginx


ADD . /usr/src/app

WORKDIR /usr/src/app

RUN bundle install -j4 --system

CMD ["make", "test"]
