FROM registry.access.redhat.com/ubi8/ubi-minimal

ENV HOME=/ubi
ENV GOPATH=/go
ENV PATH=$PATH:$GOPATH/bin
ENV GOROOT=/usr/lib/golang
ENV GO111MODULE=on

# In OpenShift, container will run as a random uid number and gid 0. Make sure things
# are writeable by the root group.
RUN mkdir -p ${HOME} && \
    chmod -R g+w ${HOME} && \
    chgrp -R root ${HOME}

# We need mercurial and it is not available in UBI8
COPY mercurial.repo /etc/yum.repos.d/mercurial.repo

# Install required packages
RUN microdnf install -y \
    git \
    make \
    tar \
    gzip \
    findutils \
    golang \
    mercurial && \
    microdnf clean all

# Install oc bin
RUN curl -s https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz | tar xz -C /usr/local/bin/

# Install required dependencies
RUN go install github.com/onsi/ginkgo/ginkgo

WORKDIR ${HOME}

ENTRYPOINT ["/bin/bash"]
