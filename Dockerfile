FROM debian:10
RUN apt-get update -yq \
    && apt-get install -yq curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -yq nodejs
RUN apt-get clean -y
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . /app/
EXPOSE 8080
VOLUME /app/logs
CMD ["node", "server.js"]