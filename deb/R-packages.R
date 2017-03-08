options("repos" = c(CRAN = "https://mirrors.nics.utk.edu/cran"))
Sys.setenv( MAKEFLAGS="-j$NUM_PROCS" )
install.packages( c(
      "setwidth"
    , "lubridate"
    , "dplyr"
    , "tidyr"
    , "reshape2"
    , "RColorBrewer"
    , "coda"
    , "ggplot2"
    , "gridExtra"
    , "GGally"
    , "devtools"
    , "lattice"
    , "ggvis"
    , "zoo"
    , "stringr"
    , "caret"
    , "rstan"
    , "shinystan" 
    ),  
    dependencies=TRUE )
library(devtools)
install_github( "jalvesaq/colorout" )

# devtools::install_github("armgong/rjulia", ref="master")
