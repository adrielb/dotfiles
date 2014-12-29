Sys.setenv( MAKEFLAGS="-j" )
install.packages( c(
      "dlm"
    , "lubridate"
    , "dplyr"
    , "hexbin"
    , "RColorBrewer"
    , "coda"
    , "ggplot2"
    , "devtools"
    ) )
library(devtools)
install_github( "jalvesaq/colorout" )
source('http://mc-stan.org/rstan/install.R', echo = TRUE, max.deparse.length = 2000)
install_rstan()
