if [[ "$(uname)" == 'Darwin' ]]; then
  # Print full JVM list with architectures.
  # /usr/libexec/java_home --verbose
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_181)
elif [[ "$(uname)" == 'Linux' ]]; then
  export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
fi
