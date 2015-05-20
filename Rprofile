# http://www.r-bloggers.com/fun-with-rprofile-and-customizing-r-startup/
options( prompt=  "R> " )
options( continue="+  " )

options("repos" = c(CRAN = "http://watson.nci.nih.gov/cran_mirror"))

# if terminal xterm=256color or screen-256color
if (grepl("256", Sys.getenv("TERM"))) {
    library("colorout")
}

library("setwidth")
