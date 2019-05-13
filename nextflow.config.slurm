

process.executor = 'slurm'
process.queue = 'normal'
process.time = '5 h'
process.clusterOptions = '-A PPI_modeling -n 1 -N 1'

singularity.autoMounts = true
//singularity.runOptions = "--home /tmp"


params {
    fasta_file = './Ce_1104_example/DB/uniprot-proteome%3AUP000001940_caeel.fasta'
    contam_file = './Ce_1104_example/DB/contam.fasta'
    mzxml_files = './Ce_1104_example/mzXML//*.mzXML'
    elut_file = 'Ce_1104_example.elut'
}


