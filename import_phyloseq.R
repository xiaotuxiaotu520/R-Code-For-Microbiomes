### IMPORTING DATA INTO PHYLOSEQ

# removes all variables in the global environment for a fresh start!
rm(list = ls(all=TRUE)) 

library("phyloseq")
library("Biostrings")

### apprach 1
biom = import_biom("otu_table.biom")
map = import_qiime_sample_data("mapping.txt")
sample_data(biom) <- map
colnames(tax_table(biom)) = c(k = "Kingdom", p = "Phylum", c = "Class", o = "Order", f = "Family", g = "Genus", s = "Species")
otus_rep_set <- readDNAStringSet("otus.fasta", format="fasta", seek.first.rec=TRUE, use.names=TRUE)
biom_ITS <- merge_phyloseq(biom, otus_rep_set)






