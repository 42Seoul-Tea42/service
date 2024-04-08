# Hard link info : service/ -> frontend/

FROM node:current-slim

WORKDIR /usr/app/

RUN		apt-get update \
		&& apt-get install -y dumb-init \
		&& npm install -g pnpm

COPY	package.json .

RUN		pnpm install

#pnpm add --prefix srcs --save-dev package-name

COPY    . .

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD ["sh", "-c", "pnpm run dev"]
