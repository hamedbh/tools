# Load readr and data.table to create the list of installed packages
library(readr)
library(data.table)

new_pkgs <- data.table(installed.packages())
# setorder(new_pkgs, Package, Version)
# setkey(new_pkgs, Package)

ifelse("Linux" %in% Sys.info(), 
       setwd("/home/rstudio/tools/"), 
       setwd("~/github/tools/"))
       
ref_pkgs <- fread("HBH_R_pkgs.csv")

bound_pkgs <- rbindlist(list(new_pkgs, ref_pkgs))
setorder(bound_pkgs, Package, Version)
merged_pkgs <- bound_pkgs[bound_pkgs[, 
                      .I[1], 
                      by = Package]$V1
           ]

file.rename("HBH_R_pkgs.csv", paste0("./pkg_lists/HBH_R_pkgs_", 
                                     Sys.Date(),
                                     "_",
                                     length(list.files("pkg_lists/")) + 1, 
                                     ".csv"))
write_csv(merged_pkgs, "HBH_R_pkgs.csv")
