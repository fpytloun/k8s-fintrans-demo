#!/bin/bash

export TS_ZOOKEEPER_RELEASE=zookeeper
export TS_KAFKA_RELEASE=kafka
export TS_INFLUXDB_RELEASE=influxdb
export TS_GRAFANA_RELEASE=grafana
export TS_FINTRANS_GENERATOR_RELEASE=generator
export TS_FINTRANS_INFLUX_RELEASE=influx-ingest
export TS_FINTRANS_LAUNDER_RELEASE=laundering-detector

helm upgrade --install ${TS_ZOOKEEPER_RELEASE} mirantisworkloads/zookeeper -f <(cat ./multi-node/configs/zoookeeper.yaml | envsubst)
helm upgrade --install ${TS_KAFKA_RELEASE} mirantisworkloads/kafka -f <(cat ./multi-node/configs/kafka.yaml | envsubst)
helm upgrade --install ${TS_INFLUXDB_RELEASE} mirantisworkloads/influxdb -f <(cat ./multi-node/configs/influxdb.yaml | envsubst)
helm upgrade --install ${TS_GRAFANA_RELEASE} mirantisworkloads/grafana -f <(cat ./multi-node/configs/grafana.yaml | envsubst)

sleep 1m

helm upgrade --install ${TS_FINTRANS_GENERATOR_RELEASE} local/fintrans-generator -f <(cat ./multi-node/configs/fintrans-generator.yaml | envsubst)
helm upgrade --install ${TS_FINTRANS_INFLUX_RELEASE} local/fintrans-influx-ingest -f <(cat ./multi-node/configs/fintrans-influx-ingest.yaml | envsubst)
helm upgrade --install ${TS_FINTRANS_LAUNDER_RELEASE} local/fintrans-laundering-detector -f <(cat ./multi-node/configs/fintrans-laundering-detector.yaml | envsubst)
