# Use the official Node.js image as the base image
FROM node:16 AS build-stage

# Set the working directory in the container
WORKDIR /app

# Copy the Angular project files into the container
COPY . .

# Install Angular dependencies
RUN npm install

# Build the Angular app with the production environment
RUN ng build --configuration=production

# Use a lighter web server image to serve the Angular app
FROM nginx:alpine

# Copy the build files to the Nginx web server directory
COPY --from=build-stage /app/dist/ /usr/share/nginx/html

# Expose port 80 to access the app
EXPOSE 80

# Command to run Nginx server
CMD ["nginx", "-g", "daemon off;"]
