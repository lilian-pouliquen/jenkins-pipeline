# Pulling node image
FROM node:lts-alpine

# Installing make
RUN apk add make bash

# Creating app directory
WORKDIR /app

# Installing Vue.js
RUN npm install --global --no-fund @vue/cli jest

# Copying app
COPY ./ /app

EXPOSE 8080

# Starting server
CMD ["npm", "run", "serve"]