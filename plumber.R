library(plumber)
source("rna_utils.R")

#* @apiTitle RNA Sequence Analysis API

#* Analyze RNA
#* @param seq The RNA sequence
#* @get /analyze
function(seq="") {
  analyze_rna(seq)
}
