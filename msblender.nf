#!/usr/bin/env nextflow

params.fasta_file = 'proteome.fa'
params.contam_file = 'contam.fasta'
params.msblender = '/MSblender'
params.searchgui = '/searchgui'
params.protein_complex_maps = '/protein_complex_maps/protein_complex_maps/'

params.mzxml_files = "*mzXML"

params.results_path = "./results"
params.elut_file = 'elut'

combined_contam_file = 'combined_contam_file.fasta'

fastaFile = file(params.fasta_file)
contamFile = file(params.contam_file)

mzxmls = Channel.fromPath(params.mzxml_files).map{ file -> tuple(file.baseName, file)}

process formatDatabase {

    input:
    file fasta from fastaFile
    file contam from contamFile

    output:
    file 'combined_contam_rev_file.fasta' into combined_contam_rev_fasta
    stdout result

    """
    echo 'combining $contam and $fasta';


    echo "input and contam fasta filename: $combined_contam_file"

    cat $contam $fasta > $combined_contam_file
    
    echo "building reverse fasta"
    ${params.msblender}/msblender-scripts/fasta-reverse.py $combined_contam_file
    
    echo "combining contam, reverse and input"
    cat $combined_contam_file.* > combined_contam_rev_file.fasta
    
    #formatdb -i combined_contam_rev_file.fasta

    #echo "formatdb: done"
    """
}

process runMSBlender {
    tag "$mzXMLID"
    publishDir "${params.results_path}/$mzXMLID", mode: 'copy'

    
    input:
    set mzXMLID, file(mzxml) from mzxmls
    file 'combined_contam_rev_file.fasta' from combined_contam_rev_fasta

    output:
    file 'output/*' into msblender_output_files
    file 'output/*group' into group_files
    stdout result2

    """
    echo "running $mzXMLID"
    echo "running $mzxml"
    mkdir working
    mkdir output
    echo "searchgui: ${params.searchgui}"
    echo "bash ${params.msblender}/runMS2.sh $mzxml combined_contam_rev_file.fasta ./working ./output ${params.searchgui}"
    bash ${params.msblender}/runMS2.sh $mzxml combined_contam_rev_file.fasta ./working ./output ${params.searchgui}
    """
}

process group2elut {

    publishDir "${params.results_path}", mode: 'copy'

    input:
    file group_file_list from group_files.collect()

    output:
    file "${params.elut_file}" into elut_file
    stdout result3

    """
    echo $group_file_list
    python ${params.protein_complex_maps}/preprocessing_util/msblender2elution.py --prot_count_files `echo $group_file_list|tr " " "\n"|sort|tr "\n" " "` --output_filename ${params.elut_file} --fraction_name_from_filename --parse_uniprot_id --remove_zero_unique
    """

}


result.subscribe {
    println it
}

result2.subscribe {
    println it
}

result3.subscribe {
    println it
}


