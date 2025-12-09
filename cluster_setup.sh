yum clean all
docker system prune -a --volumes
docker rm -f $(docker ps -a -q)

docker run --name es01 -dit -p 9200:9200 --net elastic  -m 1GB docker.elastic.co/elasticsearch/elasticsearch:9.2.1
echo "setting up master node ..."
sleep 30
export ENROLLMENT_TOKEN=$(docker exec  es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s node)
sleep 2
docker run -e ENROLLMENT_TOKEN=$ENROLLMENT_TOKEN --name es02 --net elastic -dit -m 1GB docker.elastic.co/elasticsearch/elasticsearch:9.2.1
sleep 2
docker run -e ENROLLMENT_TOKEN=$ENROLLMENT_TOKEN --name es03 --net elastic -dit -m 1GB docker.elastic.co/elasticsearch/elasticsearch:9.2.1
sleep 2
docker run -e ENROLLMENT_TOKEN=$ENROLLMENT_TOKEN --name es04 --net elastic -dit -m 1GB docker.elastic.co/elasticsearch/elasticsearch:9.2.1
sleep  2
docker run --name kib01 -dit --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:9.2.1
sleep  2
docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana

echo "cluster setup done.."

echo "elastic user password .."
docker exec -i  es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic


echo "curl -X GET -k -u elastic:<put password here>  https://localhost:9200/_cat/nodes"
