export SPARK_HOME="$HOME/spark/current"
export PATH="$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin"

export SPARK_MASTER_IP="127.0.0.1"
# export SPARK_MASTER_OPTS="-Dspark.deploy.defaultCores=2"

export SPARK_LOCAL_IP="127.0.0.1"

# export SPARK_WORKER_CORES=5
# export SPARK_WORKER_INSTANCES=2
# export SPARK_WORKER_MEMORY="4g"

# export PYSPARK_GATEWAY_SECRET=""
# export PYSPARK_GATEWAY_PORT="7707"

export PYSPARK_PYTHON="$VIRTUAL_ENV/bin/python"
export PYSPARK_DRIVER_PYTHON="$VIRTUAL_ENV/bin/jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="lab"
export PYSPARK_SUBMIT_ARGS="--master local[*] pyspark-shell --conf spark.driver.host=localhost"

export PYSPARK3_PYTHON="$VIRTUAL_ENV/bin/python"
export PYSPARK3_DRIVER_PYTHON="$VIRTUAL_ENV/bin/jupyter"
export PYSPARK3_DRIVER_PYTHON_OPTS="lab"
export PYSPARK3_SUBMIT_ARGS="--master local[*] pyspark-shell --conf spark.driver.host=localhost"
