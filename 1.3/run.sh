#!/bin/bash
sed -i "s/%CLUSTER_NAME%/${CLUSTER_NAME:-elasticsearch}/g" /app/config/elasticsearch.yml
sed -i "s/%NODE_DATA%/${NODE_DATA:-true}/g" /app/config/elasticsearch.yml
sed -i "s/%NODE_MASTER%/${NODE_MASTER:-true}/g" /app/config/elasticsearch.yml
sed -i "s/%NUM_SHARDS%/${NUM_SHARDS:-5}/g" /app/config/elasticsearch.yml

exec /app/bin/elasticsearch
