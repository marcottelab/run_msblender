#One experiment ID per line
#The experiment ID matches the name of the experiment folder
exp_list=$1

BASEDIR=$( pwd )

while read EXP_ID
do

    mkdir ${BASEDIR}/$EXP_ID
    mkdir ${BASEDIR}/$EXP_ID/DB
    mkdir ${BASEDIR}/$EXP_ID/mzXML
    mkdir ${BASEDIR}/$EXP_ID/working
    mkdir ${BASEDIR}/$EXP_ID/output

done < $exp_list



