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
BLOSUM62_clean <- read_tsv(file = "BLOSUM62_project/project_root/data/01_BLOSUM62.tsv")

# Wrangle data
# ------------------------------------------------------------------------------

# Write data
# ------------------------------------------------------------------------------
write_tsv(x = BLOSUM62_clean,
          path = "BLOSUM62_project/project_root/data/02_BLOSUM62_clean.tsv")