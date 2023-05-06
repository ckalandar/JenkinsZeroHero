FROM jenkins/jenkins
USER root
RUN apt-get update
RUN apt-get install wget -y
# updated from here
ARG DEBIAN_FRONTEND=noninteractive

ENV pip_packages "ansible cryptography"

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       sudo systemd systemd-sysv \
       build-essential wget libffi-dev libssl-dev procps \
       python3-pip python3-dev python3-setuptools python3-wheel python3-apt \
       iproute2 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

# Upgrade pip to latest version.
RUN pip3 install --upgrade pip

# Install Ansible via pip.
RUN pip3 install $pip_packages

COPY initctl_faker .
RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Make sure systemd doesn't start agettys on tty[1-6].
RUN rm -f /lib/systemd/system/multi-user.target.wants/getty.target

VOLUME ["/sys/fs/cgroup"]
#CMD ["/lib/systemd/systemd"]
# here last
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
#COPY "bashrc" /var/jenkins_home/
#RUN mv /var/jenkins_home/bashrc /var/jenkins_home/.bashrc
USER root
RUN wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.10.0/jenkins-plugin-manager-2.10.0.jar
RUN java -jar jenkins-plugin-manager-2.10.0.jar -f /usr/share/jenkins/ref/plugins.txt
USER jenkins
