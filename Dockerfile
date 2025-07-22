# 1st Phase: Build the React app
FROM node:24.4.1-alpine as builder

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . .

RUN npm run build


# 2nd Phase: Serve the React app with Nginx
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html