export SPARK_MASTER_IP="172.16.0.73"

if [[ "$(uname)" == 'Darwin' ]]; then
  export SPARK_HOME="/usr/local/Cellar/apache-spark/current"
  export SPARK_LOCAL_IP="127.0.0.1"
  # export SPARK_WORKER_CORES=2
  # export SPARK_MASTER_OPTS="-Dspark.deploy.defaultCores=2"
  # export SPARK_WORKER_MEMORY="4g"
elif [[ "$(uname)" == 'Linux' ]]; then
  export SPARK_HOME="/opt/spark"
  export SPARK_LOCAL_IP="172.16.0.73"
  export SPARK_WORKER_CORES=5
  export SPARK_WORKER_INSTANCES=2
  export SPARK_WORKER_MEMORY="16g"
  export SPARK_MASTER_OPTS="-Dspark.deploy.defaultCores=5"
fi

#export PATH="$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin"

export PYSPARK_GATEWAY_SECRET=""
export PYSPARK_GATEWAY_PORT="7707"

export PYSPARK_PYTHON="/usr/bin/python"
export PYSPARK_DRIVER_PYTHON="/usr/bin/python"
export PYSPARK3_PYTHON="/usr/bin/python3"
export PYSPARK3_DRIVER_PYTHON="/usr/bin/python3"
# export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
# export PYSPARK3_DRIVER_PYTHON_OPTS="notebook"

# export PYSPARK_SUBMIT_ARGS="--master local[*] pyspark-shell --conf spark.driver.host=localhost"
