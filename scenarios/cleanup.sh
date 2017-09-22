#!/bin/bash

export TS_ZOOKEEPER_RELEASE=zookeeper
export TS_KAFKA_RELEASE=kafka
export TS_INFLUXDB_RELEASE=influxdb
export TS_FINTRANS_GENERATOR_RELEASE=generator
export TS_FINTRANS_INFLUX_RELEASE=influx-ingest
export TS_FINTRANS_LAUNDER_RELEASE=laundering-detector
export TS_GRAFANA_RELEASE=grafana

helm delete --purge $TS_FINTRANS_LAUNDER_RELEASE
helm delete --purge $TS_FINTRANS_INFLUX_RELEASE
helm delete --purge $TS_FINTRANS_GENERATOR_RELEASE
helm delete --purge $TS_INFLUXDB_RELEASE
helm delete --purge $TS_KAFKA_RELEASE
helm delete --purge $TS_ZOOKEEPER_RELEASE
helm delete --purge $TS_GRAFANA_RELEASE

