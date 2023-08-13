FROM pandoc/ubuntu-latex:latest AS mdprocessor

WORKDIR /app

COPY guides/ /app/guides
RUN find ./guides -name "*.md" -exec sh -c 'pandoc "${0}" -o "${0%.md}.html"' {} \;

FROM node:18-alpine AS build

WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM node:18-alpine AS runtime
WORKDIR /app
COPY --from=build /app/package.json .
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/build ./build
COPY --from=mdprocessor /app/guides ./guides
CMD ["node", "build/index.js"]