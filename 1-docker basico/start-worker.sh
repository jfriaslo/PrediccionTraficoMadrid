
if ! getent hosts master; then    
    echo "=== pausa."
    sleep 10
    exit 0
fi

/opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://master:7077 --webui-port 8081