FROM mcr.microsoft.com/oryx/nodejs:10.13.0-alpine

WORKDIR /src

COPY . /src

RUN npm install

CMD ["npm","start"]