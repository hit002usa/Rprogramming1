pollutantmean <- function(directory = getwd(), pollutant = "nitrate", id = 1:332) {
    file_name1 <- formatC(id, width=3, flag="0")
    file_name2 = paste(directory, file_name1, sep = "/")
    file_name3 = paste(file_name2, "csv", sep = ".")
    test_data <- lapply(file_name3, read.csv)
    mydata <- vector("numeric")
    for (i in 1:length(id)) {
         ##avg <- mean(test_data[[1]][[pollutant]], na.rm = TRUE)
         mydata <- c(mydata, test_data[[i]][[pollutant]])
    }
    avg <- mean(mydata, na.rm = TRUE)
    return (round(avg, digits = 3))
}