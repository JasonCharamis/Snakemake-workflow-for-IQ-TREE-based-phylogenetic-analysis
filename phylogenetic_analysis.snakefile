
seq = { f[:-6] for f in os.listdir(".") if f.endswith(".fasta") }

rule all:
     input: "all_genes.fasta",
     	    "all_genes.aln",
	    "all_genes.aln.trimmed.phy.treefile"
     	    
rule mafft:
     input: expand ( "{seq}.fasta", seq = seq )
     output: "all_genes.fasta",
     	     "all_genes.aln"
     shell: "cat {input} > {output[0]} && mafft --auto {output[0]} > {output[1]}"	 

rule trimal:
     input: "all_genes.aln"
     output: "all_genes.aln.trimmed"
     shell: "trimal -in {input} -out {output} -fasta -gt 0.50"

rule convert:
     input: "all_genes.aln.trimmed"
     output: "all_genes.aln.trimmed.phy"
     shell: "/home/panos/bin/convert.sh {input} > {output}"

rule phylogenetic_tree:
     input: "all_genes.aln.trimmed.phy"
     output: "all_genes.aln.trimmed.phy.treefile"
     shell: "/data/iasonas/Programs/IQ-TREE/iqtree -s {input} -ninit 100 -alrt 1000 -bb 1000 -m MFP -nt 15"

