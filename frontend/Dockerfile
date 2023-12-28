FROM node:current-slim

WORKDIR /usr/app/srcs

RUN		apt-get update \
		&& apt-get install -y dumb-init \
		&& npm install pnpm 

COPY 	package*.json ./

RUN		pnpm install

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

COPY . .

CMD ["pnpm", "run", "dev"]
