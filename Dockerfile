FROM node:20-alpine AS builder
WORKDIR /app
COPY . .


FROM node:20-alpine AS production
WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production --ignore-scripts


COPY --from=builder /app/server.js ./
COPY --from=builder /app/index.js ./

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000
CMD ["node", "server.js"]
