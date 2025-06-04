# Use base image with Ruby installed
FROM ruby:2.2.0

# Install MongoDB
RUN apt-get update && \
    apt-get install -y mongodb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create app directory
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install dependencies
COPY app/Gemfile* $APP_HOME/
RUN bundle install

# Copy application code
ADD app/ $APP_HOME

# Start MongoDB and the application
CMD mongod --fork --logpath /var/log/mongodb.log && \
    rackup -o 0.0.0.0
