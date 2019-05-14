# Nextflow script for running MSBlender for an experiment with multiple mxZMLs

## Install nextflow and update path
```
wget -qO- https://get.nextflow.io | bash
export PATH=$PATH:`pwd`
```

## Clone run_msblender (this) repository
```
git clone https://github.com/marcottelab/run_msblender.git
```

## Checkout nextflow branch
```
git checkout nextflow
```

## Download msblender image
###TACC specific

Need to load singularity and pulling on login node runs into memory issues so do on compute node

```
module load tacc-singularity
idev -p development -A PPI_modeling -m 120
```

### Pull image from dockerhub and store in cache
```
singularity pull docker://kdrew/msblender
```

## Update nextflow.config

fasta_file : update with location of your proteome file (recommended to use uniprot proteome for species under investigation)
mzxml_files : location of mzXML mass spec files
elut_file : filename of resulting elution formatted file

## Run msblender nextflow command
nextflow run msblender.nf -with-singularity /work/02609/kdrew/singularity_cache/msblender.simg --results_path $PWD/results/ &> output

Note: update path to singularity image in cache


##Troubleshooting

###Python ImportError: undefined symbol 
Singularity automounts home directory which may have installations of python libraries that are being used instead of image's install. 

Add ```singularity.runOptions = "--home /tmp"``` to nextflow.config

###ERROR  : Home directory is not owned by calling user: /tmp
Related to above, change /tmp to a directory owned by user


