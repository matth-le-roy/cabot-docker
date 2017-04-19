# A Cabot container
#
# https://github.com/socialwareinc/cabot-docker
#
# VERSION 1.0

FROM ubuntu-upstart:trusty

RUN apt-get update
RUN apt-get install -y build-essential nodejs libpq-dev python-dev npm git \
                       curl libldap2-dev libsasl2-dev iputils-ping

RUN curl -OL https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

RUN git clone https://github.com/arachnys/cabot.git /opt/cabot
ADD fixture.json /opt/cabot/
ADD run.sh /opt/cabot/
ADD gunicorn.conf /opt/cabot/

RUN pip install -e /opt/cabot
RUN npm install --no-color -g coffee-script less@1.3

ENV PATH $PATH:/opt/cabot/
ENV PYTHONPATH $PYTHONPATH:/opt/cabot/

ENV DJANGO_SETTINGS_MODULE cabot.settings
ENV HIPCHAT_URL https://api.hipchat.com/v1/rooms/message
ENV LOG_FILE /var/log/cabot
ENV PORT 5000

ENV DJANGO_SECRET_KEY 2FL6ORhHwr5eX34pP9mMugnIOd3jzVuT45f7w430Mt5PnEwbcJgma0q8zUXNZ68A

RUN ["ln", "-s", "/usr/bin/nodejs", "/usr/bin/node"]

EXPOSE 5000
WORKDIR /opt/cabot/
CMD . /opt/cabot/run.sh
