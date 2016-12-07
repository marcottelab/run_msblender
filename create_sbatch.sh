

#One experiment ID per line
#The experiment ID matches the name of the experiment folder
exp_list=$1



while read EXP_ID
do
echo $EXP_ID
sed "s@EXPID@$EXP_ID@g" template_run_MS.sbatch > ${EXP_ID}_run_MS.sbatch 

done < $exp_list



