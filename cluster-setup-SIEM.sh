yum clean all
docker system prune -a --volumes
docker rm -f $(docker ps -a -q)
rm -rf /var/cache/PackageKit/

docker network create elastic
sleep 1
docker run --name es01 -dit -p 9200:9200 --net elastic  -m 1GB docker.elastic.co/elasticsearch/elasticsearch:9.2.1
echo "setting up master node ..."
sleep 10
docker run --name kib01  -e XPACK_ENCRYPTEDSAVEDOBJECTS_ENCRYPTIONKEY=3e54c5cd0b159bcd5f24b6f3f5650b1a -dit --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:9.2.1
sleep  2
echo "Kibana Token ...."
docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

echo "cluster setup done.."

echo "elastic user password .."
docker exec -i  es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic


echo "curl -X GET -k -u elastic:<put password here>  https://localhost:9200/_cat/nodes"
