FROM ubi8/ubi-minimal
RUN microdnf install -y git make tar gzip && \
    microdnf clean all
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz | tar xz -C /usr/local/bin/
ENTRYPOINT ["/bin/bash"]
