FROM ruby:2.5.1

MAINTAINER Vaishah KP


ENV CONTAINER_NAME refapp_container_dev
ENV SHELL /bin/bash
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH ${RBENV_ROOT}/shims:${RBENV_ROOT}/bin:${PATH}
WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY Gemfile Gemfile_test
COPY Gemfile.lock Gemfile_test.lock
RUN apt-get update && \
      apt-get -y install sudo
RUN sudo apt-get install nodejs -y
RUN sudo apt update 


RUN gem install bundler -v 1.17.1
RUN bundle install
RUN mkdir /myapp
WORKDIR /myapp
ADD . /myapp/
RUN rm -f .ruby-version
RUN rm -rf docker
RUN rm -rf log
RUN mkdir log
RUN rm -rf tmp
RUN mkdir tmp
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["sh"]
CMD ["docker-entrypoint.sh"]

#EXPOSE 3000

# Start the main process.
#CMD ["rails", "server", "-b", "0.0.0.0"]	


