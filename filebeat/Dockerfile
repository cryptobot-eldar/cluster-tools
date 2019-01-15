ARG ELK_VERSION

# https://github.com/elastic/elasticsearch-docker
FROM docker.elastic.co/beats/filebeat:${ELK_VERSION}
COPY ./filebeat.yml /usr/share/filebeat/
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
