corr <- function(directory="specdata", threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        ##files_full <-list.files(directory, full.names=TRUE)   
        files_full <-list.files(directory, full.names=TRUE)
        correl <- numeric()
        for (i in 1:332) {
                dat <- read.csv(files_full[i])
                comp_dat <- dat[complete.cases(dat),]
                if (nrow(comp_dat) > threshold) {
                        correl <- c(correl, cor(comp_dat$sulfate, comp_dat$nitrate))       
                }
        }
        return(correl)
}