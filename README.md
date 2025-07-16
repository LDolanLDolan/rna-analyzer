# 🧬 RNA Analyzer API

[![Live Demo](https://img.shields.io/badge/Live%20Demo-Visit%20Site-brightgreen?style=for-the-badge&logo=render)](https://rna-analyzer.onrender.com/)
[![API Status](https://img.shields.io/website?down_color=red&down_message=offline&style=for-the-badge&up_color=green&up_message=online&url=https%3A//rna-analyzer.onrender.com/healthz)](https://rna-analyzer.onrender.com/healthz)

**🚀 Try the live RNA sequence analyzer:** [https://rna-analyzer.onrender.com/](https://rna-analyzer.onrender.com/)

---

# RNA Analyzer API

** Live Demo:** [https://rna-analyzer.onrender.com/](https://rna-analyzer.onrender.com/)

---

# RNA Sequence Analysis API

This API, built with R and plumber, analyzes RNA sequences to provide:
- Sequence length
- GC content
- Detected open reading frames (ORFs)

## Endpoint

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


