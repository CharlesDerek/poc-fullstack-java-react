FROM node:14 as build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

FROM node:14 as runtime
WORKDIR /app
COPY --from=build /app/build ./build
COPY --from=build /app/package.json ./
COPY --from=build /app/package-lock.json ./
EXPOSE 3000
CMD ["npm", "start"]
