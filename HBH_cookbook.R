#### Maths functions ####
# Functions for harmonic and geometric means
hm_mean <- function(x) {
        (mean(x^(-1), na.rm = TRUE))^-1
}

gm_mean <- function(x, na.rm = TRUE) {
        exp(sum(log(x[x > 0]), na.rm = na.rm) / length(x))
        
}