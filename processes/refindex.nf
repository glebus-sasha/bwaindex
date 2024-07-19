// Define the `REFINDEX` process that creates the index of the genome
process REFINDEX {
    container = 'glebusasha/bwa_samtools'
    tag "$reference"
    publishDir "$params.bwaidx/REFINDEX"
//  cpus params.cpus
//	debug true
//  errorStrategy 'ignore'

    input:
    path reference

    output:
    path "*", emit: bwaidx

    script:
    """
    bwa index $reference
    """
}
