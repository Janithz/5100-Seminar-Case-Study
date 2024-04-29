#PROMPT
#You 
#it says you introduced NAs

#ChatGPT
#My apologies for the oversight. Let's correct the code to ensure it properly extracts the data matrix and handles the levels. We'll refine the code to handle the data structure correctly:

# Read the file line by line
ABRtext <- readLines('ABR-0-1.txt')

# Find the index of the line containing the ":DATA" marker
data_start_index <- grep(":DATA", ABRtext)

# Extract numerical data from lines after the ":DATA" marker
data_lines <- ABRtext[(data_start_index + 1):length(ABRtext)]

# Convert the tab-separated values to a numeric matrix
data_matrix <- as.matrix(read.table(text = data_lines, header = FALSE))

# Extract levels
levels_line <- ABRtext[grep(":LEVELS", ABRtext)]
levels <- as.numeric(unlist(strsplit(levels_line, ":"))[-(1:2)])

# Calculate the number of columns per level
cols_per_level <- ncol(data_matrix) / length(levels)

# Plot each waveform based on levels
plot_colors <- rainbow(length(levels))

plot(data_matrix, type = "l", col = "black", lwd = 1, 
     xlab = "Data Point Index", ylab = "Data Value",
     main = "Graph of Selected Data")

for (i in 1:length(levels)) {
  start_index <- (i - 1) * cols_per_level + 1
  end_index <- i * cols_per_level
  waveform <- data_matrix[, start_index:end_index]
  lines(waveform, type = "l", col = plot_colors[i], lwd = 1, 
        xlab = "Data Point Index", ylab = "Data Value",
        main = "Graph of Selected Data")
}

# Add legend for levels
legend("topright", legend = levels, col = plot_colors, lwd = 1, bty = "n")

#This code should correctly extract the data matrix and plot multiple waveforms based on different levels without introducing NAs. If you encounter any further issues or need additional assistance, feel free to ask!


