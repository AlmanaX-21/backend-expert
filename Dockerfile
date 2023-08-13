FROM node:18-alpine AS build

WORKDIR /app
COPY . .
RUN npm install ci && npm run build

FROM node:18-alpine AS runtime
WORKDIR /app
COPY --from=build /app/package.json .
COPY --from=build /app/build .
CMD ["node", "index.js"]