FROM    nginx

# front static resources move
COPY 	/out 	/usr/share/nginx/html

# Install nginx
RUN		apt-get update
RUN     rm /etc/nginx/conf.d/default.conf

# Copy files
COPY	tools/default.conf				/etc/nginx/conf.d/
COPY	tools/favicon.ico				/usr/share/nginx/html/

# Start nginx
CMD		["nginx", "-g", "daemon off;"]