FROM node:22.11-alpine
WORKDIR /app
COPY server.js package.json* ./
EXPOSE 3001
HEALTHCHECK --interval=10s --timeout=3s --start-period=3s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3001/health || exit 1
USER node
CMD ["node", "server.js"]
