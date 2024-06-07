FROM node:21.7.3-alpine3.20 as build
WORKDIR /app
COPY . .
RUN npm install -g typescript && \
    npm install && npm run build

FROM n8nio/n8n:1.45.0
COPY --from=build /app /home/node/.n8n/custom
USER root
RUN npm link /home/node/.n8n/custom
USER node