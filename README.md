# refindex_nf
Nextflow-based pipeline for BWA index and samtools (fai) index

This pipeline is prepare for 
https://github.com/glebus-sasha/deepvariant_nf
https://github.com/glebus-sasha/octopus_nf

## Usage

### Quick Start

To quickly run the pipeline, use the following command:

```bash
nextflow run glebus-sasha/refindex_nf \
-profile <docker/singularity> \
--reference <path-to-reference> \
--bwaidx <bwaidx-output-folder>
--faidx <faidx-output-folder>
```

### Requirements

- Nextflow (https://www.nextflow.io/docs/latest/install.html)
- Docker (https://docs.docker.com/engine/install/) or
- Singularity (https://github.com/sylabs/singularity/blob/main/INSTALL.md)

### Running the Pipeline

1. Install all the necessary dependencies such as Nextflow, Singularity.
3. Clone this repository: `git clone https://github.com/glebus-sasha/refindex_nf.git`
4. Navigate to the pipeline directory: `cd refindex_nf`
5. Edit the `nextflow.config` file to set the required parameters, if necessary.
6. Run the pipeline, setting the required parameters, for example:

```bash
nextflow run main.nf
```

## License

This project is licensed under the [MIT License](LICENSE).
