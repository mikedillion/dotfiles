# Java
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.4.2/Home

if [[ "$(uname)" == 'Darwin' ]]; then
  # Print full JVM list with architectures.
  # /usr/libexec/java_home --verbose
  if [ "$(whoami)" == "miked" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_181)
  elif [ "$(whoami)" == "mikedillion" ]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
  fi
elif [[ "$(uname)" == 'Linux' ]]; then
  export JAVA_HOME="$(readlink -f /usr/bin/java | sed 's:bin/java::')"
fi

# Apache Maven
# export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.3
# export M2=$M2_HOME/bin
# export PATH=$M2:$PATH

# Apache Ant
# export ANT_HOME=$PATH:/usr/local/ant
# export PATH=$PATH:$ANT_HOME/bin
