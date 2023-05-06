From ubuntu
#RUN echo 'deb [trusted=yes] http://deb.debian.org/debian testing main' > /etc/apt/sources.list.d/testing.list --allow-releaseinfo-change
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

Run useradd -m -d /home/remote_user remote_user && \
    echo "remote_user:1234" |chpasswd
#    echo "remote_user:1234" |chpasswd  && \
#    mkdir -p /home/remote_user/.ssh && \
#    chmod 700 /home/remote_user/.ssh
#Copy remote-key.pub /home/remote_user/.ssh/authorized_keys
#Run chown remote_user:remote_user -R /home/remote_user/.ssh && \
#    chmod 600 /home/remote_user/.ssh/authorized_keys
RUN sed -i'' -e's/^#PermitRootLogin prohibit-password$/PermitRootLogin yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^#PasswordAuthentication yes$/PasswordAuthentication yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^#PermitEmptyPasswords no$/PermitEmptyPasswords yes/' /etc/ssh/sshd_config \
        && sed -i'' -e's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
