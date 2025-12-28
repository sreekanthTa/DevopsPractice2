FROM node:18-alpine AS builder

WORKDIR  /app

COPY package*.json /app

RUN npm ci --only=production

COPY . /app


FROM node:18-alpine AS production

WORKDIR /app

COPY package*.json /app

RUN npm ci --only=production

COPY --from=builder /app /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

USER appuser

EXPOSE 3000

CMD [ "node", "server.js" ]


 