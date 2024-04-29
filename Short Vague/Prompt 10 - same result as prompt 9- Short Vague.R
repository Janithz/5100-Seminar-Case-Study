# #PROMPT
# 
# You
# I think we're getting there. theres now at least a visible line

#ChatGPT
#Let's try to diagnose the issue. We'll start by inspecting the extracted data to ensure it contains valid values. Additionally, we'll check if there's any issue with the plotting range. Here's the modified code:

# Read the file line by line
ABRtext <- readLines('ABR-0-1.txt')

# Find the index of the line containing the ":DATA" marker
data_start_index <- grep(":DATA", ABRtext)

# Extract numerical data from lines after the ":DATA" marker
data_lines <- ABRtext[(data_start_index + 1):length(ABRtext)]

# Convert the tab-separated values to a numeric matrix
data_matrix <- as.matrix(read.table(text = data_lines))

# Check the range of data values
cat("Data range:", range(data_matrix), "\n")

# Check if there are any NA values
cat("Number of NA values:", sum(is.na(data_matrix)), "\n")

# Extract levels
levels_line <- ABRtext[grep(":LEVELS", ABRtext)]
levels <- as.numeric(unlist(strsplit(levels_line, ":"))[-(1:2)])

# Plot each waveform based on levels
plot_colors <- rainbow(length(levels))

plot(1, type = "n", xlim = c(1, nrow(data_matrix)), ylim = range(data_matrix), 
     xlab = "Data Point Index", ylab = "Data Value", 
     main = "Graph of Selected Data")

for (i in 1:length(levels)) {
  waveform <- data_matrix[, i]
  lines(waveform, type = "l", col = plot_colors[i], lwd = 1)
}

# Add legend for levels
legend("topright", legend = levels, col = plot_colors, lwd = 1, bty = "n")

#This code will print out the range of data values and the number of NA values in the dataset. It will help us determine if there are any issues with the data or the plotting range. Let me know what you find, and we can troubleshoot further if needed!

#YIELDED THE SAME PLOT AS PROMPT 9