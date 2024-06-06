FROM node:21.7.3-alpine3.20 as build
WORKDIR /app
COPY . .
RUN npm install -g typescript && \
    npm install && npm run build

FROM n8nio/n8n:1.45.0
WORKDIR /home/node/.n8n/n8n-nodes-chatforma
COPY --from=build /app .

RUN npm link n8n-nodes-chatformaFROM node:21.7.3-alpine3.20 as build

RUN npm install -g typescript && \
    npm run build

FROM n8nio/n8n:1.45.0
WORKDIR /home/node/.n8n/n8n-nodes-chatforma
COPY --from=build /app .

RUN npm link n8n-nodes-chatforma