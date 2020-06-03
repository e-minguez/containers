FROM registry.centos.org/centos/centos:latest

ENV HOME=/ansible

# In OpenShift, container will run as a random uid number and gid 0. Make sure things
# are writeable by the root group.
RUN mkdir -p ${HOME} && \
    chmod -R g+w ${HOME} && \
		chgrp -R root ${HOME}

# Make Ansible happy with arbitrary UID/GID in OpenShift.
RUN chmod g=u /etc/passwd /etc/group

# Install required stuff for ansible-ipi-baremetal
RUN yum install -y epel-release && yum install -y \
	ansible \
	git \
	jq \
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

WORKDIR ${HOME}

# Sets entry point (same as running ansible-playbook)
ENTRYPOINT ["ansible-playbook"]
