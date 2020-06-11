FROM node:current-alpine

WORKDIR /app/service-calculator

ADD service-calculator/package.json package.json
ADD service-calculator/package-lock.json package-lock.json
RUN npm install --no-optional

ADD service-calculator /app/service-calculator
ADD common /app/common
ADD testing /app/testing

ENTRYPOINT ["npm", "start"]
