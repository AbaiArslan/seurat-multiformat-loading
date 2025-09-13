# Seurat Multiformat Loading

This repository demonstrates how to load scRNA-Seq datasets of various formats into Seurat for downstream analysis.

## Features

- Example scripts for loading data from multiple formats, such as:
  - 10x Genomics (CellRanger output)
  - Matrix Market (MTX)
  - CSV/TSV count tables
  - HDF5 (h5) files
- Basic Seurat object creation and metadata handling
- Tips for adapting to custom formats

## Usage

1. **Clone the Repository**
   ```sh
   git clone https://github.com/AbaiArslan/seurat-multiformat-loading.git
   cd seurat-multiformat-loading
   ```

2. **Prepare Your Data**
   - Place your dataset(s) in the appropriate directory as described in the scripts.
   - Supported formats include 10x Genomics folders, MTX files, CSV/TSV, and h5.

3. **Run Example Scripts**
   - Open the script corresponding to your data format in R or RStudio.
   - Follow comments in the script to adjust paths and parameters as needed.

## Dependencies

- [Seurat](https://satijalab.org/seurat/)
- tidyverse
- Matrix
- data.table
- (Optional) rhdf5

Install dependencies in R:

```r
install.packages(c("Seurat", "tidyverse", "Matrix", "data.table"))
if (!requireNamespace("rhdf5", quietly = TRUE)) {
  BiocManager::install("rhdf5")
}
```

## Example

Scripts in this repository show how to:

- Load 10x Genomics output using `Read10X()`
- Load count matrices from CSV or TSV files
- Load MTX formats with feature/barcode files
- Load HDF5 (h5) formatted data

## References

- [Seurat - Loading data](https://satijalab.org/seurat/articles/essential_commands.html)
- [Seurat - Input formats](https://satijalab.org/seurat/articles/input_formats.html)

## License

MIT License

---

For questions or contributions, please open an issue or submit a pull request.