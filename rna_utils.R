library(Biostrings)
library(AnnotationHub)
library(biomaRt)

analyze_rna <- function(seq) {
  if (nchar(seq) == 0) return(list(error = "Empty sequence"))

  seq <- toupper(seq)
  rna <- RNAString(seq)

  gc <- letterFrequency(rna, letters = "GC", as.prob = TRUE)
  orfs <- findORFs(rna, minimumLength=60)

  list(
    length = nchar(seq),
    gc_content = gc,
    orf_count = length(orfs),
    orfs = lapply(orfs, function(orf) list(start=orf@start, end=orf@end))
  )
}
