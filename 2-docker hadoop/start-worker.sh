#!/bin/bash

if ! getent hosts master; then    
    sleep 10
    exit 0
fi

sudo service ssh start

export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
export YARN_CONF_DIR=/opt/hadoop/etc/hadoop

hdfs --daemon start datanode

/opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://master:7077 --webui-port 8081 




