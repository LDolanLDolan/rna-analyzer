# 🧬 RNA Sequence Analysis API

This API, built with R and plumber, analyzes RNA sequences to provide:
- Sequence length
- GC content
- Detected open reading frames (ORFs)

## 🔬 Endpoint

### `GET /analyze?seq=RNA_SEQUENCE`
Returns JSON with:
- `length`: Length of the RNA string
- `gc_content`: GC proportion
- `orf_count`: Number of open reading frames
- `orfs`: Positions of ORFs

Example call:
```
curl 'https://your-deployment-url/analyze?seq=AUGGCU...'
```

Powered by Bioconductor.
