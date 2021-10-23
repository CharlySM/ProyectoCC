FROM alpine/bundle:latest

WORKDIR /usr/src/app

ADD ./src ./src
ADD ./test ./test
ADD ./views ./views
COPY ./index.rb .
COPY ./Gemfile .
COPY ./Rakefile .

RUN bundle install

CMD ["rake"]
