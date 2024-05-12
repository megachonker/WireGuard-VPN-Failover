FROM debian
RUN apt-get update && apt-get install wireguard-tools  -y
RUN apt-get install iperf3 iproute2 iputils-ping -y
COPY cli-b.conf /etc/wireguard/cli-b.conf
COPY pute.sh /suce.sh
ENTRYPOINT [ "sh", "/suce.sh" ]
# CMD ["/bin/wg-quick", "up", "cli-b"]

# Use ENTRYPOINT to run WireGuard in the foreground
# ENTRYPOINT ["wg-quick","up","cli-b"]
# ENTRYPOINT ["wg-quick", "up", "cli-b"]
# ENTRYPOINT ["echo", "up", "cli-b"]

# Keep the container running
# CMD ["sleep", "infinity"]
# CMD ["tail", "-f", "/dev/null"]