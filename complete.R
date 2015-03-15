complete <- function(directory = getwd(), id = 1:332) {
    ##directory = "specdata"
    ##id = 1
    file_name1 <- formatC(id, width=3, flag="0")
    file_name2 = paste(directory, file_name1, sep = "/")
    file_name3 = paste(file_name2, "csv", sep = ".")
    test_data <- lapply(file_name3, read.csv)
    ##mydata <- vector("numeric")
    mydata <- data.frame(id = integer(0), nobs = integer(0))
    for (i in 1:length(id)) {
         count <- sum(complete.cases(test_data[[i]]))
         mydata[i, 1] = id[i]
         mydata[i, 2] = count
    }
    return (mydata)
}