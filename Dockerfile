FROM sameersbn/ubuntu:12.04.20140519
MAINTAINER sameer@damagehead.com

RUN apt-get update && \
		apt-get install -y nginx php5-common php5-cli php5-fpm \
			php5-mysql php5-pgsql php5-gd && \
		apt-get clean # 20140625

ADD assets/ /app/
RUN chmod 755 /app/init /app/setup/install
RUN /app/setup/install

ADD authorized_keys /root/.ssh/

EXPOSE 80

ENTRYPOINT ["/app/init"]
CMD ["app:start"]
