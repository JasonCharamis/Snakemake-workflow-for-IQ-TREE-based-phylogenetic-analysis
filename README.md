**Automated phylogenetic analysis using Snakemake**

This is a Snakemake pipeline for automated maximum likelihood (ML) phylogenetic analysis. 

It includes producing and editing the multiple sequence alignment (MSA), and using the modified MSA for maximum likelihood phylogenetic analysis.

Wildcard is {identifier}.fasta

Usage:

**snakemake --cores 10 --snakefile Snakefile**

Dependencies:

Mafft

https://github.com/GSLBiotech/mafft

Trimal

https://github.com/inab/trimal

IQ-TREE

https://github.com/Cibiv/IQ-TREE

