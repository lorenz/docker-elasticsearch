ElasticSeach Container
====================

This is a full-fledged ElasticSearch image which has the latest patch version for every minor release of ElasticSearch since 1.0 available.

### Installing
  docker pull lorenz/elasticsearch:1.4

Versions available: `1.0`, `1.1`, `1.2`, `1.3`, `1.4`

### Configuration
You can either provide your own configuration at `/app/config/elasticsearch.yml` or use the following environment variables:

* `CLUSTER_NAME` specifies the name of the cluster. Defaults to `elasticsearch`.
* `NODE_DATA` specifies if the node is allowed to hold data. Defaults to `true`.
* `NODE_MASTER` specifies if the node is allowed to be a master. Defaults to `true`.
* `NUM_SHARDS` specifies the number of shards. Defaults to `5`.

### Volumes
To persist the data, the image has a volume at `/data` defined. You can either attach that to a data container or bind it to a host directory.

### Examples
Development instance:
  docker run -d -e CLUSTER_NAME=dev -v /home/lorenz/volumes/elasticsearch-dev:/data --rm lorenz/elasticsearch:1.4

Production cluster:
  docker run -d -e CLUSTER_NAME=prod1 -e NODE_DATA=false -e NUM_SHARDS=10 -v /mnt/ssd1/elasticsearch1:/data --rm lorenz/elasticsearch:1.4
  docker run -d -e CLUSTER_NAME=prod1 -e NODE_DATA=true -e NODE_MASTER=false -e NUM_SHARDS=10 -v /mnt/ssd1/elasticsearch1:/data --rm lorenz/elasticsearch:1.4
  docker run -d -e CLUSTER_NAME=prod1 -e NODE_DATA=true -e NODE_MASTER=false -e NUM_SHARDS=10 -v /mnt/ssd1/elasticsearch1:/data --rm lorenz/elasticsearch:1.4
