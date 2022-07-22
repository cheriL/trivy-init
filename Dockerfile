FROM busybox:1.31.1

RUN mkdir -p trivy/db
COPY metadata.json trivy.db trivy/db/
RUN ls -la /trivy/db && ls -la

CMD ["sh"]
