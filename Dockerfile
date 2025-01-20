# Use official Node.js image as base
FROM node:20-bullseye

# Set working directory
WORKDIR /app

# Run npm init to generate package.json
RUN npm init -y

# Install dependencies (express, react, react-scripts, tailwindcss)
RUN npm install express react react-scripts tailwindcss mongodb

# Copy the rest of the application
COPY . .

# Expose port 8080
EXPOSE 8080

# Set bash as default command
CMD ["bash"]
