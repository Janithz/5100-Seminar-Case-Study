# # PROMPT
# #YOU
# Error in plot.window(...) : need finite 'xlim' values
# In addition: Warning messages:
#   1: In min(x) : no non-missing arguments to min; returning Inf
# 2: In max(x) : no non-missing arguments to max; returning -Inf
# 3: In min(x) : no non-missing arguments to min; returning Inf
# 4: In max(x) : no non-missing arguments to max; returning -Inf

# 
# ChatGPT
# It seems that the data_values object might be empty or contain only missing values, causing the plot function to encounter errors when determining the range for the x-axis. Let's add some error checking and handling to ensure that the data is valid before attempting to plot it:

ABRtext <- readLines('ABR-0-1.txt')

# Filter lines containing data (starting with ":")
data_lines <- grep("^:", ABRtext, value = TRUE, invert = TRUE)

# Extract numerical data from selected lines
# Assuming numerical data follows the pattern ":Key: Value"
# Modify the regular expression pattern based on the actual structure of your data
data_values <- sapply(data_lines, function(line) {
  match <- regmatches(line, regexpr(":([-+]?[0-9]*\\.?[0-9]+(?:[eE][-+]?[0-9]+)?)", line))
  as.numeric(sub("^:", "", match))
})

# Flatten the list of data values
data_values <- unlist(data_values)
# Check if data_values is empty or contains only missing values
if(length(data_values) == 0 || all(is.na(data_values))) {
  cat("No valid data to plot.")
} else {
  # Plot the extracted data
  plot(data_values, type = "l", col = "black", lwd = 1, 
       xlab = "Data Point Index", ylab = "Data Value",
       main = "Graph of Selected Data")
}
#This code first checks if the data_values object is empty or contains only missing values using the length function and is.na function. If there's no valid data, it prints a message indicating that. If there is valid data, it proceeds to plot it.

#This additional error handling should prevent the plot function from encountering errors related to empty or missing data values. If you still encounter issues, please let me know!


#ERROR 
#No valid data to plot

