# You
# now how do I run the graphing code on only that selection
# 
# 
# ChatGPT
# To run the graphing code on the selected data lines, you can first process the selected lines to extract the numerical data and then proceed with the graphing code. Since the lines you provided earlier seem to contain some metadata as well as numerical values, we need to parse them accordingly. Here's how you can do it:

# Read the file line by line
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

# Plot the extracted data
plot(data_values, type = "l", col = "black", lwd = 1, 
     xlab = "Data Point Index", ylab = "Data Value",
     main = "Graph of Selected Data")
# 
# In this code:
#   
#   We first filter the lines containing data using grep.
# Then we extract numerical values from the selected lines. This assumes that the numerical data follows a specific pattern ":Key: Value". You may need to adjust the regular expression pattern based on the actual structure of your data.
# Finally, we plot the extracted data using the plot function. Adjust the plotting parameters (type, col, lwd, etc.) according to your preferences.
# Please replace the assumed pattern :Key: Value with the actual pattern in your data if it differs. If you provide a sample of your data, I can tailor the code more precisely.



#ERROR: 
# Error in xy.coords(x, y, xlabel, ylabel, log) : 
# 'x' is a list, but does not have components 'x' and 'y'