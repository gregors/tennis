From ruby:2.5

#RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app/

CMD ["bundle", "exec", "rspec", "--color", "--format", "doc"]
