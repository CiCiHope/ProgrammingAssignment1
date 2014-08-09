pollutantmean <- function(directory, pollutant, id=1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        files_full <-list.files(directory, full.names=TRUE)  ##creates a list of files based on the directory arg. of the func.
        dat <- data.frame() ##creates an empty data frame
        for (i in id) {
                dat <- rbind(dat, read.csv(files_full[i]))
        }  ##loops through the files joining them together
        dat_subset <- dat[,pollutant]  ##subset by the pollutant argument
        mean <- mean(dat_subset,na.rm=TRUE)
        return(round(mean,3))
}