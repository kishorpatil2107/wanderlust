FROM node:21 as backend-builder

WORKDIR /app
COPY . . 
RUN npm i
RUN npm run test 
FROM node:21-slim
WORKDIR /app
COPY --from=backend-builder /app .
COPY .env.docker .env
EXPOSE 3000
CMD ["npm", "start"]
