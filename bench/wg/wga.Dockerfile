FROM debian
RUN apt-get update && apt-get install wireguard-tools  -y
RUN apt-get install iperf3 iproute2 iputils-ping -y
COPY cli-a.conf /etc/wireguard/cli-a.conf
COPY pute.sh /suce.sh

# RUN wg-quick up cli-a

# CMD ["/bin/sh","-c","wg-quick up cli-a"]
# CMD [ "/bin/wg-quick", "up", "cli-a"]
# ENTRYPOINT ["/bin/sleep","100"]
# ENTRYPOINT ["wg-quick","up","cli-a"]
# ENTRYPOINT ["wg-quick","up","cli-a"]
CMD [ "sh", "/suce.sh" ]

# CMD ["bash", "-c", "wg-quick up cli-a && tail -f /dev/null"]
# CMD ["/bin/wg-quick", "up", "cli-a"]
