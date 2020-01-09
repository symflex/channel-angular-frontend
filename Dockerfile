FROM debian:10.2

ENV DEBIAN_FRONTEND noninteractive
#ENV DEBIAN_FRONTEND teletype

RUN apt update -y && \
    apt install -y --no-install-recommends apt-utils && \
    apt install gcc g++ make curl -y

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update -y && \
    apt install yarn -y

CMD ["yarn", "start"]
