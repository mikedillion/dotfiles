options(repos = c(CRAN = "http://cran.rstudio.com"))

# local({r <- getOption("repos")
#       r["CRAN"] <- "http://cran.revolutionanalytics.com"
#       options(repos=r)})
#

options(editor="vim")

utils::rc.settings(ipck=TRUE)

.First <- function() {
	if(interactive()) {
	library(utils)
	timestamp(,prefix=paste("##------ [",getwd(),"] ",sep=""))
	}
}

.Last <- function() {
	if(interactive()){
	hist_file <- Sys.getenv("R_HISTFILE")
	if(hist_file=="") hist_file <- "~/.RHistory"
	savehistory(hist_file)
	}
}

if(Sys.getenv("TERM") == "xterm-256color")
  library("colorout")

.env <- new.env()

.env$sshhh <- function(a.package) {
	suppressWarnings(suppressPackageStartupMessages(
		library(a.package, character.only=TRUE)))
}

attach(.env)

if(interactive()) {
	invisible(sapply(autoloads, sshhh))
}

# options(stringsAsFactors=FALSE)
#
# options(max.print=100)
#
# options(scipen=10)
#
# options(show.signif.stars=FALSE)
#
# options(menu.graphics=FALSE)
#
# options(prompt="> ")
# options(continue="... ")
#
# options(width = 80)
#
# q <- function (save="no", ...) {
#   quit(save=save, ...)
# }
#
# auto.loads <-c("dplyr", "ggplot2")
