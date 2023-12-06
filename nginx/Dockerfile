# Base image
FROM    nginx

# Install nginx
RUN		apt-get update
RUN     rm /etc/nginx/conf.d/default.conf

# Copy files
COPY	tools/default.conf				/etc/nginx/conf.d/

# Start nginx
CMD		["nginx", "-g", "daemon off;"]