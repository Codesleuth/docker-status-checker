FROM node:8.11.2-alpine as build

WORKDIR /usr/app/build

COPY package.json npm-shrinkwrap.json ./
RUN npm install --production


FROM node:8.11.2-alpine

WORKDIR /opt/status-checker

COPY --from=build /usr/app/build ./
COPY . .

# Expose API port
EXPOSE 9090

CMD ["node", "."]
