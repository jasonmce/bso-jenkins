# Adds nodejs for gulp/grunt and and linkcheck to jenkins.
FROM jenkins

# Switch to root to install additional software.
USER root

# Install Node package manager for NodeJS v6
# from https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs build-essential

# Install linkchecker
RUN apt-cache showpkg linkchecker &&\
    apt-get install -y linkchecker

# Return default to the jenkins user.
USER jenkins
