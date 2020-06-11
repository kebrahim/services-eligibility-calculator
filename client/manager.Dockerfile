FROM node:current-alpine

WORKDIR /app/service-manager

ADD service-manager/package.json package.json
ADD service-manager/package-lock.json package-lock.json
RUN npm install --no-optional

ADD service-manager /app/service-manager
ADD common /app/common
ADD testing /app/testing

ENTRYPOINT ["npm", "start"]
