# plumber.R
# Fix BOM and force Git update
library(methods)
library(plumber)
library(Biostrings)
library(jsonlite)

#* Health check endpoint
#* @get /healthz
function() {
  list(status = "OK", message = "RNA Analyzer is running!")
}

#* @apiTitle RNA Analyzer API

#* Analyze RNA sequence and return match counts
#* @post /analyze
#* @serializer json
function(req, res) {
  tryCatch({
    body <- fromJSON(req$postBody)

    sequence <- toupper(body$sequence)
    query <- toupper(body$query)

    if (is.null(sequence) || is.null(query) || sequence == "" || query == "") {
      res$status <- 400
      return(list(error = "Both 'sequence' and 'query' must be provided."))
    }

    # Perform matching using Biostrings
    subject <- DNAString(sequence)
    pattern <- DNAString(query)
    matches <- matchPattern(pattern, subject)

    return(list(
      sequence_length = length(subject),
      query = query,
      match_count = length(matches),
      match_positions = start(matches)
    ))

  }, error = function(e) {
    res$sta

