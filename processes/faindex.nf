// Define the `FAINDEX` process that prepares the reference genome indices
process FAINDEX {
    container = 'glebusasha/bwa_samtools'
    tag "$reference"
    publishDir "$params.faidx/FAINDEX"
//	  debug true
//    errorStrategy 'ignore'

    input:
    path reference

    output:
    path "${reference}.fai", emit: fai

    script:
    """
    samtools faidx "$reference"
    """
}