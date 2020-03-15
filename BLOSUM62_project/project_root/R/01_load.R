# Clear workspace
# ------------------------------------------------------------------------------
rm(list = ls())

# Load libraries
# ------------------------------------------------------------------------------
library("tidyverse")

# Define functions
# ------------------------------------------------------------------------------
# source(file = "BLOSUM62_project/project_root/R/99_project_functions.R")

# Load data
# ------------------------------------------------------------------------------
BLOSUM62_raw <- read_tsv(file = "BLOSUM62_project/project_root/data/_raw/BLOSUM62_ncbi.tsv")

# Wrangle data
# ------------------------------------------------------------------------------
BLOSUM62 <- BLOSUM62_raw 

# Write data
# ------------------------------------------------------------------------------
write_tsv(x = BLOSUM62,
          path = "BLOSUM62_project/project_root/data/01_BLOSUM62.tsv")