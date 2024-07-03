FROM ruby:3.1.1

# Install Node.js, PostgreSQL client, and ping
RUN apt-get update && apt-get install -y nodejs postgresql-client iputils-ping

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Specify the command to run on container start
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
