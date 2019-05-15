# Use an official Python runtime as a parent image
FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install git -y
RUN apt-get install gcc -y
RUN apt-get install gsl-bin -y
RUN apt-get install libgsl-dev -y
RUN git clone https://github.com/compomics/searchgui.git
RUN git clone --branch consistent_search_params https://github.com/marcottelab/MSblender.git
WORKDIR /MSblender/src/
RUN /MSblender/src/compile

RUN apt-get install python -y
RUN apt-get install default-jre -y
RUN apt-get install wget -y


RUN apt-get install python-pip -y
RUN apt-get install python-mysqldb -y
#kdrew: still interactive
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install r-base -y

RUN pip install numpy 
RUN pip install pandas==0.17.1 
RUN pip install scipy 
RUN pip install sklearn 
RUN pip install networkx
RUN pip install AgglomCluster==1.0.2
RUN pip install matplotlib
RUN pip install seaborn
RUN pip install rpy2==2.8.6
RUN pip install requests
RUN pip install biopython
RUN pip install mpmath
RUN pip install numexpr

RUN apt-get install blast2 -y

# Set the working directory to /app
WORKDIR /msblender/

#kdrew: download contaminants file
RUN wget https://raw.githubusercontent.com/marcottelab/run_msblender/master/Ce_1104_example/DB/contam.fasta
RUN mkdir working
RUN mkdir output

COPY protein_complex_maps/ /protein_complex_maps/

ENV PYTHONPATH "${PYTHONPATH}:/protein_complex_maps/"

#ENTRYPOINT ["bash", "/MSblender/runMS2.sh"]

