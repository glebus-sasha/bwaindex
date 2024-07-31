// Define the `REFINDEX` process that creates the index of the genome
process REFINDEX {
    container = 'glebusasha/bwa_samtools'
    tag "$reference"
    publishDir "$params.bwaidx/REFINDEX"
//	debug true
//  errorStrategy 'ignore'

    input:
    path reference

    output:
    tuple path("${reference}.amb") path("${reference}.ann") path("${reference}.bwt") path("${reference}.pac") path("${reference}.sa"), emit: bwaidx

    script:
    """
    bwa index $reference
    """
}
