FROM nextgenhealthcare/connect:3.11
WORKDIR /opt/connect

USER root

EXPOSE 8080 8443
WORKDIR /opt/connect/extensions

RUN apt install unzip
RUN wget -q http://downloads.mirthcorp.com/fhir/3.11.0/fhir-3.11.0.b1424.zip
RUN unzip -qn fhir-3.11.0.b1424.zip

WORKDIR /opt/connect
COPY entrypoint.sh /
RUN chmod 755 /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

RUN chown -R mirth:mirth /opt/connect
USER mirth
CMD ["./mcserver"]
