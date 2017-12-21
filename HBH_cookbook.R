#### Maths functions ####
# Functions for harmonic and geometric means
hm_mean <- function(x) {
        (mean(x^(-1), na.rm = TRUE))^-1
}

gm_mean <- function(x, na.rm = TRUE) {
        exp(sum(log(x[x > 0]), na.rm = na.rm) / length(x))
        
}

#### Days/decimal hours converter ####
convert_decimal_time <- function(days = 0, hours = 0.0) {
        full_days <- 0L
        full_hrs <- 0L
        full_mins <- 0L
        
        if (days > 0) {
                hours <- hours + ((as.integer(days) + (days %% 1)) * 7.4)
        }
        
        if (hours > 0) {
                full_days <- hours %/% 7.4
                full_hrs <- (hours %% 7.4) %/% 1
                full_mins <- round(((hours %% 7.4) %% 1) * 60)
        }
        
        paste0("Total time is ", 
               full_days, 
               " days, ", 
               full_hrs, 
               " hours, and ", 
               full_mins, 
               " minutes.")
}
