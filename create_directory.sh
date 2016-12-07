#One experiment ID per line
#The experiment ID matches the name of the experiment folder
exp_list=$1

while read EXP_ID
do

mkdir $EXP_ID
mkdir $EXP_ID/DB
mkdir $EXP_ID/mzxml
mkdir $EXP_ID/working
mkdir $EXP_ID/output

done < $exp_list



