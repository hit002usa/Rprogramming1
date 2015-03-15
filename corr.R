corr <- function(directory = getwd(), threshold = 0) {
    ##directory = "specdata"
    ##threshold = 0
    file_name1 <- formatC(1:332, width=3, flag="0")
    file_name2 = paste(directory, file_name1, sep = "/")
    file_name3 = paste(file_name2, "csv", sep = ".")
    test_data <- lapply(file_name3, read.csv)
    record_data <- complete(directory)
    refine_data <- subset(record_data, nobs > threshold)
    id <- refine_data$id
    mydata <- vector("numeric")
    if (length(id) < 1){
        return(round(mydata, digits = 5))   
    }else{
            for (i in 1:length(id)) {
                test_data_na <- na.omit(test_data[[id[i]]])
                sulfate_data <- test_data_na$sulfate
                nitrate_data <- test_data_na$nitrate
                corr_coeff <- cor(sulfate_data, nitrate_data)
                mydata <- c(mydata, corr_coeff)
            }
            mydata <- na.omit(mydata)
            return (round(mydata, digits = 5))
    }
}

