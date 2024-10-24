alias wg-start="docker compose -f ~/vpn/wg/docker-compose.yml up -d"

alias wg-start-docker="docker run -d \
  --name=wg-easy \
  -e LANG=ru \
  -e WG_HOST=166.1.160.125 \
  -e PASSWORD_HASH='\$2a\$12\$V6O.9yapJPQY2Zpx4tq6Luy7pL5OizzyZ9Ej2LQ9FADC57q4NrLwC' \
  -e PORT=51821 \
  -e WG_PORT=51820 \
  -e WG_ENABLE_ONE_TIME_LINKS=true \
  -e UI_TRAFFIC_STATS=true \
  -e ENABLE_PROMETHEUS_METRICS=true \
  -e PROMETHEUS_METRICS_PASSWORD='\$2a\$12\$V6O.9yapJPQY2Zpx4tq6Luy7pL5OizzyZ9Ej2LQ9FADC57q4NrLwC' \
  -v ~/.wg-easy:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl='net.ipv4.conf.all.src_valid_mark=1' \
  --sysctl='net.ipv4.ip_forward=1' \
  --restart unless-stopped \
  ghcr.io/weejewel/wg-easy"


