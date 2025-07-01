FROM ubuntu:trusty

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update
RUN apt-get update

# Start editing
# Install package here for cache
RUN apt-get -y install supervisor postfix sasl2-bin opendkim opendkim-tools

# Add files
COPY assets/install.sh /opt/install.sh

# Run
CMD /bin/sh -c "/opt/install.sh ; /usr/bin/supervisord -c /etc/supervisor/supervisord.conf"
