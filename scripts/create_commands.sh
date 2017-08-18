
#One experiment ID per line
#The experiment ID matches the name of the experiment folder

exp_list=$1
runscript=$2
searchgui_dir=$3
#OpenMS_dir=$4

BASEDIR=$( pwd )



while read EXP_ID
do

    #The file where the commands will be written to
    EXP_COMMANDS=${BASEDIR}/${EXP_ID}_COMMANDS.txt

    #Remove if this file already exists
    rm -f $EXP_COMMANDS

    exp_dir=${BASEDIR}/${EXP_ID}

    proteome_dir=${exp_dir}/DB

    working_dir=${exp_dir}/working

    output_dir=${exp_dir}/output

    proteome=$(ls ${proteome_dir}/*contam.combined.fasta)

    echo $proteome

    mzxml_dir=${BASEDIR}/${EXP_ID}/mzXML


    #This is echoing the text for one commands to the COMMANDS script
    for mzxml_file in ${mzxml_dir}/*.mzXML
    do 
        echo "bash $runscript $mzxml_file $proteome $working_dir $output_dir $searchgui_dir" >> $EXP_COMMANDS

        #Example hard coded
        #echo "bash $WORK/MSblender/runMS2.sh $SCRATCH/metazoans/$n $proteome $SCRATCH/metazoans/$EXP_ID/working $SCRATCH/metazoans/$EXP_ID/output $HOME/searchgui" >> $EXP_COMMANDS

    done
done < $exp_list



