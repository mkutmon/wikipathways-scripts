## ---------------------------
##
## Script name: database-comparison.R
## Purpose of script: Pathway database gene content comparison
## Author: mkutmon
## Date Created: 2021-10-01
##
## ---------------------------
##
## Notes:
## Quick solution to compare gene content between gene set collections
## for the different pathway databases
## Source of gene sets: MSigDb (https://www.gsea-msigdb.org/gsea/msigdb/)
##
## ---------------------------

install.packages("msigdbr")
install.packages("ggvenn")
library(msigdbr)
library(ggvenn)

# comparison of WikiPathways, Reactome, KEGG (more collections available here: msigdbr::msigdbr_collections())

wp = msigdbr(species = "Homo sapiens", category="C2", subcategory ="CP:WIKIPATHWAYS")
reactome = msigdbr(species = "Homo sapiens", category="C2", subcategory ="CP:REACTOME")
kegg = msigdbr(species = "Homo sapiens", category="C2", subcategory ="CP:KEGG")

wp.genes <- unique(wp$entrez_gene)
reactome.genes <- unique(reactome$entrez_gene)
kegg.genes <- unique(kegg$entrez_gene)

data <- list(wp = wp.genes, reactome = reactome.genes, kegg = kegg.genes)
names(data) <- c("WP","Reactome","KEGG")

ggvenn(
  data, 
  fill_color = c("#0073C2FF", "#EFC000FF", "#CD534CFF"),
  stroke_size = 0.5, set_name_size = 4, show_percentage = FALSE
)
