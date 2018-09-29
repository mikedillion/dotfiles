export HADOOP_PREFIX="/opt/hadoop"
export HADOOP_CONF_DIR="$HADOOP_PREFIX/etc/hadoop"

export JAVA_LIBRARY_PATH="$HADOOP_PREFIX/lib/native"
export LD_LIBRARY_PATH="$HADOOP_PREFIX/lib/native"

#export PATH="$PATH:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin"

export LIVY_PREFIX="/opt/livy/"
export PATH="$PATH:$LIVY_PREFIX/bin"
