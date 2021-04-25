FROM centos:latest
ENV http_proxy=10.144.100.14:8080
ENV https_proxy=10.144.100.14:8080
RUN yum -y install epel-release
RUN yum install -y python38
RUN yum install -y twine
RUN yum install -y python3-pip
RUN pip3 install --upgrade pip
#RUN mkdir -p /libcloud
COPY libcloud /libcloud
WORKDIR /libcloud
RUN pip3.8 install -r requirements.txt
RUN /usr/bin/python3.8 setup.py bdist_wheel