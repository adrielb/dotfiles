options("repos" = c(CRAN = "http://watson.nci.nih.gov/cran_mirror"))
Sys.setenv( MAKEFLAGS="-j$NUM_PROCS" )
install.packages( c(
      "dlm"
    , "lubridate"
    , "dplyr"
    , "tidyr"
    , "reshape2"
    , "RColorBrewer"
    , "coda"
    , "ggplot2"
    , "devtools"
    , "lattice"
    , "ggvis"
    , "zoo"
    , "stringr"
    ) )
library(devtools)
install_github( "jalvesaq/colorout" )
source('http://mc-stan.org/rstan/install.R', echo = TRUE, max.deparse.length = 2000)
install_rstan()
