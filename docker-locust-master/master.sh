#!/bin/sh

INSTANCE_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

/usr/local/bin/locust -f /locust/test.py --master --host=${TARGET_HOST}

datetime=`date +%s`
curl -X PUT -d ${INSTANCE_IP} "${INSTANCE_IP}:8500/v1/kv/locust/master/ip?flags=${datetime}"
