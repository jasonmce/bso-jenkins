Extends the default Jenkins container to include Nodejs (for grunt and gulp) and Linkchecker.
http://wummel.github.io/linkchecker/
https://nodejs.org/

# For a new local data volume.  I like var_jenkins_home, use whatever makes you happy.
JENKINS_HOME=$(pwd)/var_jenkins_home
mkdir 1000:1000 ${JENKINS_HOME}

# Create a new jenkins with property ports and start points.
docker run -d \
  --name bso-jenkins \
  -v ${JENKINS_HOME}:/var/jenkins_home \
  -p 8080:8080 \
  bso-jenkins

# Get the initial login password you will be prompted for.
docker logs 2>&1 bso-jenkins | grep -A 2 "Please use the following password"
