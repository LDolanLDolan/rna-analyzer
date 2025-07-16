library(methods)
library(plumber)
library(Biostrings)
library(jsonlite)

#* Serve the interactive HTML interface
#* @get /
#* @serializer html
function() {
  # Read and serve the HTML file directly (fixed - no pipe operator)
  if (file.exists("index.html")) {
    html_lines <- readLines("index.html", warn = FALSE)
    paste(html_lines, collapse = "\n")
  } else {
    "<h1>HTML file not found</h1>"
  }
}

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
    res$status <- 500
    return(list(error = paste("Internal server error:", e$message)))
  })
}
