# Clear workspace
# ------------------------------------------------------------------------------
rm(list = ls())

# Load libraries
# ------------------------------------------------------------------------------
library("tidyverse")
library("broom")

# Define functions
# ------------------------------------------------------------------------------
# source(file = "BLOSUM62_project/project_root/R/99_project_functions.R")

# Load data
# ------------------------------------------------------------------------------
BLOSUM62_analysis <- read_tsv(file = "BLOSUM62_project/project_root/data/03_BLOSUM62_aug.tsv")


# Wrangle data (adding PCfitted values to BLOSUM62 tibble)
# ------------------------------------------------------------------------------
BLOSUM62_analysis_PCA <- BLOSUM62_analysis %>% 
select(-aa) %>% 
  prcomp(center = TRUE, scale = TRUE)

BLOSUM62_analysis_aug <- BLOSUM62_analysis_PCA %>% 
  augment(BLOSUM62_analysis)

# Model data
# ------------------------------------------------------------------------------

get_chem_class <- function(x){
  chem_cols <- c("A" = "Hydrophobic", "R" = "Basic", "N" = "Neutral", "D" = "Acidic",
                 "C" = "sulphur", "Q" = "Neutral", "E" = "Acidic", "G" = "Polar",
                 "H" = "Basic", "I" = "Hydrophobic", "L" = "Hydrophobic", "K" = "Basic",
                 "M" = "sulphur", "F" = "Hydrophobic", "P" = "Hydrophobic", "S" = "Polar",
                 "T" = "Polar", "W" = "Hydrophobic", "Y" = "Polar", "V" = "Hydrophobic")
  return(factor(chem_cols[x]))
}

BLOSUM62_analysis_aug <- BLOSUM62_analysis_aug %>% 
    mutate(chem_class = get_chem_class(aa))
  
# Visualisation: scree plot (BLOSUM62_analysis_PCA) and PCA plot (BLOSUM62_analysis_aug)
# ------------------------------------------------------------------------------
  

 
Scree_plot <- BLOSUM62_analysis_PCA %>%
    tidy("pcs") %>% 
    ggplot(aes(x = PC, y = percent)) +
    geom_col() +
    theme_bw()

Scree_plot
  
PCA_plot <- BLOSUM62_analysis_aug %>% 
    ggplot(aes(x = .fittedPC1, y = .fittedPC2, label = aa, colour = chem_class)) +
    geom_text() +
    theme(legend.position = "bottom")

PCA_plot

# Write data
# ------------------------------------------------------------------------------
write_tsv(x = BLOSUM62_analysis_aug,
           path = "BLOSUM62_project/project_root/results/BLOSUM62_analysis_aug.tsv")

  ggsave(PCA_plot, filename = "BLOSUM62_project/project_root/results/PCA_plot.png",
         width = 10,
         height = 6)

  ggsave(Scree_plot, filename = "BLOSUM62_project/project_root/results/Scree_plot.png",
         width = 10,
         height = 6)


