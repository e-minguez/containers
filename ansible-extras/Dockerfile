FROM https://registry.centos.org/centos/centos:latest

# Make Ansible happy with arbitrary UID/GID in OpenShift.
RUN chmod g=u /etc/passwd /etc/group

# Install required stuff for ansible-ipi-baremetal
RUN yum install -y epel-release && yum install -y \
		ansible \
		git \
		python-dns \
		python2-dns \
		python-netaddr \
		python2-jmespath \
		python2-passlib \
		patch && \
    yum clean all

# Sets environment variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_SSH_PIPELINING True

WORKDIR /

# Sets entry point (same as running ansible-playbook)
ENTRYPOINT ["ansible-playbook"]