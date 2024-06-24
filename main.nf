#!/usr/bin/env nextflow

// Include processes
include { REFINDEX }            from './processes/refindex.nf'

// Logging pipeline information
log.info """\
    ==========================================
                B W A  I N D E X
    ==========================================

    reference:  ${params.reference}
    bwaidx:     ${params.bwaidx}
    """
    .stripIndent(true)

// Define help
if ( params.help ) {
    help = """main.nf: This repository contains a Nextflow pipeline for analyzing 
            |Next-Generation Sequencing (NGS) data using octopus 
            |
            |Required arguments:
            |   --reference     Location of the reference file.
            |                   [default: ${params.reference}]
            |   --bwaidx        Location of the output file file.
            |                   [default: ${params.bwaidx}]
            |
            |Optional arguments:
            |   -profile        <docker/singularity>
            |   -reports        Generate pipeline reports
            |
""".stripMargin()
    // Print the help with the stripped margin and exit
    println(help)
    exit(0)
}

// Define the workflow
workflow {
    REFINDEX(params.reference)
    // Make the pipeline reports directory if it needs
    if ( params.reports ) {
        def pipeline_report_dir = new File("${params.bwaidx}/pipeline_info/")
        pipeline_report_dir.mkdirs()
    }
}

// Log pipeline execution summary on completion
workflow.onComplete {
    log.info """\
        Pipeline execution summary
        ---------------------------
        Completed at: ${workflow.complete}
        Duration    : ${workflow.duration}
        Success     : ${workflow.success}
        workDir     : ${workflow.workDir}
        exit status : ${workflow.exitStatus}
        """
        .stripIndent()
        
    log.info ( workflow.success ? "\nDone" : "\nOops" )
}




