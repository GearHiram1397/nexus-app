# Use base image with Ruby installed
FROM ruby:3.1-slim

# Install required build tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

# Create app directory
ENV APP_HOME /app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Install dependencies
COPY nexus-app/Gemfile* $APP_HOME/
RUN bundle install

# Copy application code
COPY nexus-app/ $APP_HOME

# Start the application
CMD ["rackup", "-o", "0.0.0.0"]
