FROM ansible/ansible-runner:latest

# Make Ansible happy with arbitrary UID/GID in OpenShift.
RUN chmod g=u /etc/passwd /etc/group

# Install required stuff for ansible-ipi-baremetal
RUN yum install -y git python-dns python2-jmespath patch && \
    yum clean all

WORKDIR /runner

ENTRYPOINT ["entrypoint"]
CMD ["ansible-runner", "run", "/runner"]
