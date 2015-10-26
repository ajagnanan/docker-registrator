FROM gliderlabs/registrator:latest

ADD run.sh /
ENTRYPOINT []

CMD ["/run.sh"]
