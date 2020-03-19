FROM registry.centos.org/centos/centos:latest

ENV APP_ROOT=/opt/app-root \
		USER_NAME=ansible \
    USER_UID=10001

RUN mkdir -p ${APP_ROOT} && \
		useradd -l -u ${USER_UID} -r -g 0 -d ${APP_ROOT} -s /sbin/nologin -c "${USER_NAME} user" ${USER_NAME} && \
    chown -R ${USER_UID}:0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT}

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

### Containers should NOT run as root as a good practice
USER 10001
WORKDIR ${APP_ROOT}

# Sets entry point (same as running ansible-playbook)
ENTRYPOINT ["ansible-playbook"]