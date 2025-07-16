library(plumber)
source("rna_utils.R")

#* @apiTitle RNA Sequence Analysis API
#* @apiDescription This API accepts a POST request with a JSON body containing an RNA sequence and returns analysis data.

#* Analyze RNA sequence
#* @post /analyze
#* @json
function(req) {
  # Parse JSON from the request body
  body <- jsonlite::fromJSON(req$postBody)
  
  if (is.null(body$sequence)) {
    return(list(error = "Missing 'sequence' in request body"))
  }
  
  # Call the analysis function
  result <- analyze_rna(body$sequence)
  return(result)
}
