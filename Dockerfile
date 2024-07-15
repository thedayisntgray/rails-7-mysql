# Dockerfile
FROM ruby:3.1.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs yarn

# Set up working directory
WORKDIR /myapp

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code
COPY . .

# Precompile assets
RUN bundle exec rails assets:precompile

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
