# # Build frontend
# FROM node:current-slim AS builder

# WORKDIR /usr/app/

# RUN		apt-get update \
# 		&& apt-get install -y dumb-init \
# 		&& npm install -g pnpm

# COPY	frontend/package.json .

# RUN		pnpm install

# COPY    frontend/ .

# RUN     pnpm run build


FROM    nginx

# front static resources move
# COPY --from=builder usr/app/out /usr/share/nginx/html

# Install nginx
RUN		apt-get update
RUN     rm /etc/nginx/conf.d/default.conf


# Copy files
COPY	tools/default.conf				/etc/nginx/conf.d/
COPY	tools/favicon.ico				/usr/share/nginx/html/

# Start nginx
CMD		["nginx", "-g", "daemon off;"]