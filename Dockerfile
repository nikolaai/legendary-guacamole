# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY my-app/package*.json ./

# Install app dependencies
RUN npm install
RUN npm update

# Copy the rest of the app source code to the container
COPY ./my-app .

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
