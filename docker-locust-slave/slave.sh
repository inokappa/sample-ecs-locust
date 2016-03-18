#!/bin/sh

INSTANCE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MASTER_IP=$(curl -s -X GET "${INSTANCE_IP}:8500/v1/kv/locust/master/ip?raw")

/usr/local/bin/locust -f /locust/test.py --slave \
  --master-host=${MASTER_IP} \
  --host=${TARGET_HOST}
