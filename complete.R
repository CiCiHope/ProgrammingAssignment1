complete <- function(directory="specdata", id=1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases 
            
        files_full <-list.files(directory, full.names=TRUE)  ##creates a list of files based on the directory arg. of the func.
        nobs <- numeric() ##creates an empty vector
        for (i in id) {
                id_data <- read.csv(files_full[i])
                id_nobs <- sum(complete.cases(id_data))
                nobs <- c(nobs,id_nobs)
        }
       data.frame(id,nobs)             
}