FROM docker/whalesay:latest
RUN apt-get update && apt-get install -y wget python3 python3-pip git-core
RUN pip3 install --upgrade pip
RUN pip3 install jupyter
RUN pip3 install jupyter-spark
RUN mkdir -p /home/aml
RUN cd /home/aml/ && git clone https://github.com/DistributedSystemsGroup/Algorithmic-Machine-Learning .
EXPOSE 8888 8888
#RUN cd /tmp/ && wget https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh
#RUN cd /tmp && bash Anaconda3-4.3.1-Linux-x86_64.sh
#CMD cd /home/aml && jupyter notebook
CMD PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook" pyspark
