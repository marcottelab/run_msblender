
#One experiment ID per line
#The experiment ID matches the name of the experiment folder
exp_list=$1


while read EXP_ID
do

EXP_COMMANDS=${EXP_ID}_COMMANDS.txt
PROTEOME=$(ls ${SCRATCH}/metazoans/${EXP_ID}/DB/*contam.combined.fasta)
echo $PROTEOME
rm -f $EXP_COMMANDS
for n in $EXP_ID/mzXML/*.mzXML

do echo $n
echo "bash $WORK/MS1-quant-pipeline/runMs2.sh $SCRATCH/metazoans/$n $PROTEOME $SCRATCH/metazoans/$EXP_ID/working $SCRATCH/metazoans/$EXP_ID/output" >> $EXP_COMMANDS

done
done < $exp_list



