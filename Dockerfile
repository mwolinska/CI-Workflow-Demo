FROM ubuntu:20.04 as demo_image
RUN apt-get update && apt-get -y upgrade
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y curl

# Set python 3.8 as default
RUN apt-get install --no-install-recommends -y python3.8 python3.8-dev python3-distutils python3.8-venv
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 0

# RUN apt-get -y install python3-pip also a correct option to install pip
# Install Pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py
WORKDIR /workdir

COPY requirements.txt /workdir/requirements.txt
COPY src /workdir/src
# COPY cli.sh /workdir/cli.sh

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "-m", "src.main"]





# every docker line needs to start with a docker command e.g. RUN for echo, ls, cd
#
# ubuntu 20:04 - is a docker tag
