#!/bin/bash
#/opt/spark/bin/spark-class org.apache.spark.deploy.master.Master --port 7077 --webui-port 8080

sudo service ssh start

export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
export YARN_CONF_DIR=/opt/hadoop/etc/hadoop

export HADOOP_CONF_DIR=/opt/hadoop/etc/hadoop
export YARN_CONF_DIR=/opt/hadoop/etc/hadoop

if [ ! -f /opt/hadoop/dfs/name/current/VERSION ]; then ### ojo
    echo "Formateamos name node"
    hdfs namenode -format -force -nonInteractive
else
    echo "NameNode already formatted, skipping format..."
fi

hdfs --daemon start namenode
spark-class org.apache.spark.deploy.master.Master --host 0.0.0.0 --port 7077 --webui-port 8080
