FROM ubuntu:wily

ENV DEBIAN_FRONTEND noninteractive

# Usual update / upgrade
RUN apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y

# Install our favorite vcs and other requirements
RUN apt-get install -y git xvfb python python-irclib python-dbus python-gobject dbus-x11 wget supervisor

# Install pip
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# Install Skype... eurk
RUN apt-get install -y software-properties-common
RUN dpkg --add-architecture i386
RUN add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
RUN apt-get update
RUN apt-get install -y skype

# Install skype2irc requirements
RUN pip install skype4py

# Get skype2irc
RUN git clone --depth=1 https://github.com/caktux/skype2irc.git

# Install x11vnc for first run to allow Skype API
RUN apt-get install -y x11vnc
RUN apt-get install -y fluxbox
ENV DISPLAY :1
EXPOSE 5900

# Add credentials
ADD credentials credentials

# Add configurations
ADD config.py skype2irc/config.py

# Add Skype start script
ADD start.sh start.sh
RUN chmod +x /start.sh

# Add supervisor configs
ADD supervisord.conf supervisord.conf

CMD ["-n", "-c", "/supervisord.conf"]
ENTRYPOINT ["/usr/bin/supervisord"]
