

bash scripts/create_directory.sh $SCRATCH/metazoans/exp_list_example.txt

#Here, make sure mzXMLS are in the experiment mzxml folder,  and the formatted fasta database in in the experimnet DB folder


bash scripts/create_commands.sh $SCRATCH/metazoans/exp_list_example.txt $WORK/MSblender/runMS2.sh $HOME/searchgui


bash scripts/create_sbatch.sh $SCRATCH/metazoans/exp_list_example.txt



