FROM ubuntu:20.04
MAINTAINER Kuzmina Anna 
RUN apt-get update -y 
COPY . /opt/gsom_predictor 
WORKDIR /opt/gsom_predictor 
RUN apt install -y python3-pip 
RUN pip3 install -r req.txt 
CMD python3 app.py 

