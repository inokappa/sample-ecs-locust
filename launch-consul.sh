#
# 1
#
docker run --net=host -d \
-p 8300:8300 \
-p 8301:8301/tcp \
-p 8302:8302/tcp \
-p 8301:8301/udp \
-p 8302:8302/udp \
-p 8303:8303 \
-p 8400:8400 \
-p 8500:8500 \
-p 8600:8600 \
--name consul-node01 \
gliderlabs/consul-server \
-server \
-bootstrap \
-advertise $(curl http://169.254.169.254/latest/meta-data/local-ipv4) \
-atlas=username/demo01 --atlas-join --atlas-token=${Atlas Token}

#
# 2
#
docker run --net=host -d \
-p 8300:8300 \
-p 8301:8301/tcp \
-p 8302:8302/tcp \
-p 8301:8301/udp \
-p 8302:8302/udp \
-p 8303:8303 \
-p 8400:8400 \
-p 8500:8500 \
-p 8600:8600 \
--name consul-node02 \
gliderlabs/consul-server \
-server \
-advertise $(curl http://169.254.169.254/latest/meta-data/local-ipv4) \
-atlas=username/demo01 --atlas-join --atlas-token=${Atlas Token}

