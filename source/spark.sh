export SPARK_HOME='/usr/local/Cellar/apache-spark/current'
export PATH="$PATH:$SPARK_HOME/bin"

export SPARK_MASTER_IP="localhost"
export SPARK_WORKER_MEMORY="4g"

export PYSPARK_PYTHON="$VIRTUAL_ENV/bin/python"
# export PYSPARK_DRIVER_PYTHON="$VIRTUAL_ENV/bin/ipython"
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
export PYSPARK_SUBMIT_ARGS='--master local[2] pyspark-shell'
