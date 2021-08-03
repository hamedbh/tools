## Setup file for installing the common packages on a new ec2 instance

# Install rstan -----------------------------------------------------------

# https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
remove.packages("rstan")
if (file.exists(".RData")) file.remove(".RData")

# Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1) # only necessary for Linux without the nodejs library / headers
install.packages("rstan", repos = "https://cloud.r-project.org/", dependencies = TRUE)

# test that the install worked correctly
library(rstan)
example(stan_model, package = "rstan", run.dontrun = TRUE)


# Install cmdstanr --------------------------------------------------------

# we recommend running this is a fresh R session or restarting your current session
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))

# Install rethinking and some other bayesian stuff ------------------------

install.packages("remotes")
install.packages(c("coda", "mvtnorm", "devtools", "loo", "dagitty"))
remotes::install_github("rmcelreath/rethinking")
install.packages("bayesplot")
install.packages("brms")
install.packages("rstanarm")


# Install tidyverse and related stuff -------------------------------------

install.packages("tidyverse")
install.packages("tidymodels")
install.packages("bookdown")
