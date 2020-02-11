FROM ansible/ansible-runner:latest

RUN yum install -y git && yum clean all


WORKDIR /runner

ENTRYPOINT ["entrypoint"]
CMD ["ansible-runner", "run", "/runner"]
