# 1st Phase: Build the React app
FROM node:24.4.1-alpine AS builder

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

RUN npm run build


# 2nd Phase: Serve the React app with Nginx
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html