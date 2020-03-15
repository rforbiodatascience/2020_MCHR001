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
BLOSUM62_aug <- read_tsv(file = "BLOSUM62_project/project_root/data/02_BLOSUM62_clean.tsv")

# Wrangle data
# ------------------------------------------------------------------------------

  
# Write data
# ------------------------------------------------------------------------------
write_tsv(x = BLOSUM62_aug,
          path = "BLOSUM62_project/project_root/data/03_BLOSUM62_aug.tsv")