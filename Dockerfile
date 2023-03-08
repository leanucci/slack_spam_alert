FROM ruby:3.1.0

RUN apt-get update

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install --jobs 4 --retry 3

COPY . /app

EXPOSE 2300

CMD ["bundle", "exec", "hanami", "server", "--host", "0.0.0.0"]
