

bash scripts/create_directory.sh $SCRATCH/run_msblender/exp_list.txt
#Here, make sure mzXMLS are in the experiment mzxml folder,  and the formatted fasta database in in the experiment DB folder
#exp_name
#-----mzXML
#-----DB



bash scripts/create_commands.sh $SCRATCH/run_msblender/exp_list_example.txt /work/03491/cmcwhite/MSblender/runMS2.sh $HOME/SearchGUI-3.2.18/


bash scripts/create_sbatch.sh $SCRATCH/run_msblender/exp_list.txt



