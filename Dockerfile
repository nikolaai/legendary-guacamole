# Use an official Node.js runtime as a parent image
FROM node:14-alpine as build

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY my-app/package*.json ./

# Install app dependencies
RUN npm install
RUN npm update
RUN npm audit fix --force

# Copy the rest of the app source code to the container
COPY ./my-app .

# Build the app
RUN npm run build --prod

# use nginx alpine image to run the app
FROM nginx:alpine

# Copy the build output to replace the default nginx contents.
COPY --from=build /app/dist/my-app /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

# # Use an official Node.js runtime as a parent image
# FROM node:14-alpine

# # Set the working directory to /app
# WORKDIR /app

# # Copy the package.json and package-lock.json files to the container
# COPY my-app/package*.json ./

# # Install app dependencies
# RUN npm install --only=production
# RUN npm update
# RUN npm audit fix --force

# # Copy the rest of the app source code to the container
# COPY --from=build /app/dist/my-app .

# # Run the app
# CMD ["node", "server.js"]




# Expose port 3000
# EXPOSE 3000

# Start the app
# CMD ["npm", "start"]
