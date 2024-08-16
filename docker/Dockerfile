ARG OS_BASE

FROM ubuntu AS base-ubuntu


RUN apt update \
    && apt install -y \
    wget \
    openjdk-21-jdk


FROM ghcr.io/cybernop/validate-fhir-profiles:base-$OS_BASE

ARG VAL_VERSION

RUN wget https://github.com/hapifhir/org.hl7.fhir.core/releases/download/${VAL_VERSION}/validator_cli.jar -O /root/validator_cli.jar

COPY entrypoint.sh /root/entrypoint.sh
RUN chmod a+rx /root && chmod a+x /root/entrypoint.sh

ENTRYPOINT [ "/root/entrypoint.sh", "/project" ]
