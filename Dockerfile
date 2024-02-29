# Use the official lightweight Node.js 14 image.
# https://hub.docker.com/_/node
FROM node:latest

# Install git
RUN apt-get update && apt-get install -y git

# Create and change to the app directory.
WORKDIR /usr/src/app

# Clone your code from GitHub
RUN git clone https://github.com/prakashr7d/crm-frontend .

# Change to the cloned directory
WORKDIR /usr/src/app/crm-frontend
RUN git checkout new
# Install production dependencies.
RUN npm install --only=production

# Expose the port the app runs on
EXPOSE 3000

# Run the web service on container startup.
CMD [ "npm", "run", "dev" ]