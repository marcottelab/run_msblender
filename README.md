# Wrapper for running MSBlender for an experiment with multiple mxZMLs
### On TACC or not TACC 

## Setup experiment directory

Start with a folder for each experiment containing a folder called mzXML containing its mzxml files and a folder called DB containing formatted fasta database. See below for how to make a formatted fasta



#### Structure of an experiment directory for experiment Ce1104

Ce1104_example

-----mzXML
---------- WAN1100427_OT2_Celegans_HCW_P1A01.mzXML
---------- WAN1100427_OT2_Celegans_HCW_P1A02.mzXML
-----DB
---------- uniprot-proteome%3AUP000001940_caeel_contam.combined.fasta


Write each experiment you want to process as one line in a list of experiment IDs

This can be a one line file with one experiment or multiline with multiple experiments

For example:

```
$ cat exp_list_example.txt
Ce1104_example
```

#### Create additional folders in the experiment directory

```
$ bash create_directory.sh exp_list_example.txt 
```

#### Format msblender commands for each mzXML in the experiments

Need to manually change location of MS1-quant-pipeline directory in create_commands.sh

Creates file for each experiment called [experimentID]_commands.txt

```
$ bash create_commands.sh exp_list_example.txt
```

#### Create the TACC job submission script to process the commands in parallel

Need to manually edit header in template_run_MS.sbatch

Creates file for each experiment called [experimentid]_run_MS.sbatch


```
$ bash create_sbatch.sh exp_list_example.txt
$ sbatch Ce_1104_example_run_MS.sbatch

```

#### If not on TACC, process the commands with parallel

```
$ parallel -j4 :::: Ce1104_COMMANDS.txt
```




### Format fasta DB

This goes in /DB folder of each experiment

Can also format ahead of time for a proteome and just cp in to the DB folder

##### Add on contaminants and reverse proteome

```
$ bash /project/cmcwhite/scripts/MS1-quant-pipeline/setup/setup_database_only.sh uniprot-triticum%3AUP000019116.fasta
```

##### Generate blast formatted db 

```
$ formatdb -i uniprot-triticum%3AUP000019116_contam.combined.fasta
```







