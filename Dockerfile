FROM node:18-slim

WORKDIR /app

# Have nodemon available for local dev use (file watching)
RUN npm install -g nodemon

COPY package*.json ./
COPY . ./

# RUN npm ci && \
#     npm cache clean --force && \
#     mv /usr/local/app/node_modules /node_modules

RUN npm install && \
    mv /app/node_modules /node_modules

COPY . .

ENV RESULT_PORT=80
EXPOSE 80

CMD ["node", "server.js"]
