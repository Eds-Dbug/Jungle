# Use an official Ruby runtime as a parent image
FROM ruby:3.1.1

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install any needed packages specified in the Gemfile
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Make port 4567 available to the world outside this container
EXPOSE 4567

# Define the command to run the application
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
