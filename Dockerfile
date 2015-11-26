FROM svanosselaer/ansible-ubuntu:14.04
MAINTAINER Sean Van Osselaer <svo@qual.is>

ADD . /provisioning

RUN ansible-playbook provisioning/playbook.yml && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y

CMD bash -c "service riak start && tail -F /var/log/riak/console.log"

EXPOSE 8087 8098
