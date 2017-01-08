# Adds nodejs for gulp/grunt and and linkcheck to jenkins.
FROM jenkins

# Switch to root to install additional software.
USER root

# Need the latest and greatest for python, installing it first.
RUN apt-get update && apt-get --yes upgrade

### Begin installing Node package manager for NodeJS v6.
# Based on https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs build-essential
### End installing NodeJS.

### Begin installing linkchecker.
# Set up python and pip.
RUN apt-get install --yes python-dev build-essential python-pip
RUN pip install --upgrade pip
RUN pip install requests urllib3[secure]
# Grab the latest deb and install it.
ADD http://ftp.debian.org/debian/pool/main/l/linkchecker/linkchecker_9.3-4_amd64.deb /tmp/linkchecker_9.3-4_amd64.deb
RUN dpkg -i /tmp/linkchecker_9.3-4_amd64.deb
### End installing linkchecker.

# Return default to the jenkins user.
USER jenkins
