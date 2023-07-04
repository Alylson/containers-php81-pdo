FROM php:8.1-fpm

WORKDIR /var/www/html

RUN apt update -y && apt install --no-install-recommends unzip wget -y

COPY . .
ADD /instant_client/instantclient-basic-linux.x64-21.10.0.0.0dbru.zip /usr/local/instantclient-basic-linux.x64-21.10.0.0.0dbru.zip
ADD /instant_client/instantclient-sdk-linux.x64-21.10.0.0.0dbru.zip /usr/local/instantclient-sdk-linux.x64-21.10.0.0.0dbru.zip

# Install Oracle Instantclient
RUN unzip /usr/local/instantclient-basic-linux.x64-21.10.0.0.0dbru.zip -d /usr/local/ \
    && unzip /usr/local/instantclient-sdk-linux.x64-21.10.0.0.0dbru.zip -d /usr/local/    
RUN sh -c "echo /usr/local/instantclient_21_10 > /etc/ld.so.conf.d/oracle-instantclient.conf"
RUN export PATH="$PATH:/usr/local/instantclient_21_10"
RUN export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/instantclient_21_10"
RUN ldconfig

# Install lib php oracle
RUN apt update -y && apt install -y --no-install-recommends libaio-dev

# Install Oracle extensions
RUN docker-php-ext-configure pdo_oci --with-pdo_oci=instantclient,/usr/local/instantclient_21_10,21.1
RUN docker-php-ext-install pdo_oci
RUN docker-php-ext-configure oci8 --with-oci8=instantclient,/usr/local/instantclient_21_10,21.1
RUN docker-php-ext-install oci8

# Ignore ssl verify
RUN git config --global http.sslVerify false

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer