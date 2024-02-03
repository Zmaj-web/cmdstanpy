FROM ubuntu:20.04

COPY requirements.txt .

RUN apt-get -y update
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install cmdstanpy[all]
RUN python3 -c 'import cmdstanpy; cmdstanpy.install_cmdstan()'
RUN pip install -r requirements.txt

WORKDIR /workdir

ENTRYPOINT ["/bin/bash", "-l", "-c", "jupyter-lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='hogehoge'"]
CMD ["--notebook-dir=/workdir"]