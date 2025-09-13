### Install Packages----
install.packages("Seurat")
install.packages("remotes")
remotes::install_github("mojaveazure/seurat-disk")
install.packages("patchwork")
install.packages("SeuratObject")

###Loading Libraries----
library(Seurat)
library(SeuratDisk)
library(patchwork)
library(rhdf5)
library(SeuratObject)

### .RDS Format----
df_rdf <- readRDS('data/ependymal_cells.rds')
str(df_rdf) # to view your object i.e. df_rdf

### 10x Cell Ranger .HDF5 Format----
df_hdf5 <- Read10X_h5( filename = "data/20k_PBMC_3p_HT_nextgem_Chromium_X_filtered_feature_bc_matrix.h5",
                       use.names = TRUE,
                       unique.features = TRUE )
df_hdf5[1:10, 1:10] # to view first 10 rows and first 10 columns

seurat_hdf5 <- CreateSeuratObject( counts = df_hdf5) #convert hdf5 to searut 
str(seurat_hdf5) # to view it as searut object

rm(serat_hdf5) # to delete the mispelled crated object


### .mtx Format----
untar(
  "data/20k_PBMC_3p_HT_nextgem_Chromium_X_raw_feature_bc_matrix.tar.gz",
  exdir = "data/unzipped/") # Unzip .gz file first 
df_mtx <- ReadMtx(mtx = "data/matrix.mtx.gz",
                  features = "data/features.tsv.gz",
                  cells = "data/barcodes.tsv.gz")
df_mtx[1:10, 1:10] # view first 10 rows and columns
seurat_mtx <- CreateSeuratObject( counts = df_mtx )
str(searut_mtx)


### .loom Format----
df_loom <- Connect(filename = '')
# I don't have the this file format.
### .h5ad format----

# Step 1: Convert .h5ad to .h5seurat
Convert("data/adata_SS2_for_download.h5ad", dest = "h5seurat", overwrite = TRUE)

# Step 3: Load .h5seurat into a Seurat object, skipping images
seurat_anndata <- LoadH5Seurat("data/adata_SS2_for_download.h5seurat", assays = "RNA", layers = NULL, images = FALSE)

# Step 4 (optional): View summary
seurat_anndata
str(seurat_anndata)