# Check whether I'm on a Mac, and if so set .libPaths() correctly
if(!("Linux" %in% Sys.info()['sysname'])) {
        .libPaths("~/Library/R/3.x/library")
}

# Now setwd() depending on system, to ensure path to package list will be 
# correct
if("Linux" %in% Sys.info()['sysname']) {
        setwd("/home/rstudio/tools")
} else {
        setwd("~/github/tools")
}

# Function to test each package in the list, install only if not already present
install_new_pkgs <- function(pkg) {
    if(!pkg %in% installed.packages()) {
        install.packages(pkg)
    }
}

# Installing helper packages for reading in the list of packages, as it's more 
# reliable than the base R functions, and mapping function to list of 
# packages
install_new_pkgs("readr")
library(readr)
install_new_pkgs("purrr")
library(purrr)

# Read in the list of packages as a character vector
pkg_file <- "HBH_R_pkgs.csv"
pkg_list <- read_csv(pkg_file)$Package

# Use Map to run the function against each element of pkg_list
map(pkg_list, install_new_pkgs)

# Cut the list down to those that did not install correctly. Run that list 
# through a new version of the function that stops for confirmation after each 
# package.
remaining_pkgs <- pkg_list[!pkg_list %in% installed.packages()]

install_rem_pkgs <- function(pkg) {
        if(!pkg %in% installed.packages()) {
                install.packages(pkg)
                readline(prompt = paste0(pkg, 
                                         " has finished, press RETURN to continue."))
        }
}

map(remaining_pkgs, install_rem_pkgs)