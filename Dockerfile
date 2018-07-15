FROM williamyeh/ansible:centos7

MAINTAINER Takeshi Kondo <take.she12@gmail.com>

ENV RUBY_VERSION 2.5.0

RUN yum -y install \
  bzip2 \
  gcc \
  git \
  openssl-devel \
  readline-devel \
  zlib-devel

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
ENV PATH /root/.rbenv/bin:/root/.rbenv/shims/:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh && \
  exec $SHELL -l

RUN rbenv install -v $RUBY_VERSION
RUN rbenv rehash
RUN rbenv global $RUBY_VERSION

RUN gem install bundle
COPY Gemfile Gemfile
RUN bundle install
