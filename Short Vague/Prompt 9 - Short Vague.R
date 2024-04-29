#PROMPT
# 
# You
# idk what that did but it just yielded a ball of squiggles in the corner

#ChatGPT
#Let's simplify the process and ensure the correct plotting of multiple waveforms based on different levels. We'll adjust the code to directly extract and plot the data for each level:
  

# Read the file line by line
ABRtext <- readLines('ABR-0-1.txt')

# Find the index of the line containing the ":DATA" marker
data_start_index <- grep(":DATA", ABRtext)

# Extract numerical data from lines after the ":DATA" marker
data_lines <- ABRtext[(data_start_index + 1):length(ABRtext)]

# Convert the tab-separated values to a numeric matrix
data_matrix <- as.matrix(read.table(text = data_lines))

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

#This code should plot multiple waveforms based on different levels correctly. Each waveform is plotted in a different color, and a legend is added to indicate the levels. If you encounter any further issues or need additional assistance, feel free to ask!

