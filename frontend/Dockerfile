FROM node:current-slim

WORKDIR /usr/app/

RUN		apt-get update \
		&& apt-get install -y dumb-init \
		&& npm install -g pnpm

COPY	. .

RUN    chmod +x init_package.sh

#pnpm add --prefix srcs --save-dev package-name

ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD ["sh", "init_package.sh"]
