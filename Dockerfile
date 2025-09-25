# Use Node.js LTS version
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy app source
COPY . .

# Expose the app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]

