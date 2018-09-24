FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Copy from builder the designated folder
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# start -> default command