# Move less frequently changing things higher in this file.

FROM ruby:2.6.5-alpine

ENV RAILS_LOG_TO_STDOUT=true \
  RAILS_SERVE_STATIC_FILES=true

ARG BUILDER

LABEL "host.openpath.app"=open-path-warehouse
LABEL "host.openpath.role"=web
LABEL "host.openpath.ruby-version"=2.6.5

RUN apk add --no-cache \
  nodejs yarn \
  tzdata \
  freetds-dev \
  icu icu-dev \
  libcurl curl-dev \
  imagemagick6-dev \
  libmagic file-dev file \
  build-base libxml2-dev libxslt-dev postgresql-dev

# Add a script to be executed every time the container starts.
COPY docker/deploy/entrypoint.sh /usr/bin/

# allow tls connection to database with verification
COPY docker/deploy/rds-combined-ca-bundle.pem /etc/ssl/certs/rds-combined-ca-bundle.pem

RUN mkdir -p /openpath/tmp/pids

WORKDIR /openpath

#WIP: ARG for bundler version?
RUN gem install bundler --version=1.17.3

COPY Gemfile Gemfile.lock Rakefile config.ru package.json ./
COPY bin ./bin
COPY public ./public

RUN bundle install --without=development

COPY lib ./lib
COPY config ./config
COPY spec ./spec
COPY db ./db
COPY app ./app
COPY vendor ./vendor

# WIP: See if we can find a gem configuration that lets us copy over the assets from a temporary container and ditch many of the dependencies that are just to be able to compile JS.
# Just need this so that assets will build. Then we remove it
COPY docker/deploy/dotenv.temporary ./.env
RUN RAILS_ENV=production bundle exec rake assets:precompile
RUN rm .env

COPY docker/deploy/REVISION ./

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 80

# Start the main process.
CMD ["puma", "-p", "80"]
