FROM debian:wheezy
MAINTAINER joel <joel.hansson@dulvie.se>

# Install sources.list containing backports, security updates etc.
ADD sources.list /etc/apt/
RUN apt-get update

RUN apt-get install -y \
  sudo \
  tmux \
  locales \
  git \
  build-essential \
  automake \
  autoconf \
  libssl-dev \
  libexpat1-dev \
  libncursesw5-dev \
  ncurses-term \
  libreadline6 \
  libglib2.0-dev \
  libnotify-dev \
  libcurl4-openssl-dev \
  libltdl-dev \
  libotr5 \
  libotr5-dev \
  libtool \
  libxss-dev

RUN sed -i 's/# en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen
RUN locale-gen en_US.UTF-8
RUN locale-gen
RUN echo 'LANG=en_US.UTF-8' > /etc/default/locale

RUN git clone https://github.com/boothj5/profanity /opt/profanity
WORKDIR /opt/profanity
RUN ./bootstrap.sh && ./install-all.sh

RUN adduser --disabled-password --gecos '' user && echo "user:foobar" | chpasswd

RUN echo 'export LC_ALL=en_US.UTF-8' > /home/user/.bashrc
RUN echo 'export LANG=en_US.UTF-8' > /home/user/.bashrc

CMD ["/bin/bash"]
