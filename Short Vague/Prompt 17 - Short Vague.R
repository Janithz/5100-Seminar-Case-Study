#PROMPT 17
#You
# that is much better - also I was wrong it is decibel level not frequency
# 
# ChatGPT
# ChatGPT
# Thank you for the clarification. If the data represents decibel levels instead of frequencies, we can adjust the code accordingly. We'll extract the decibel levels from the metadata and use them to label the plot and the legend.
# 
# Here's the modified code:

# Extract decibel levels from the metadata
levels_line <- ABRtext[grep(":LEVELS", ABRtext)]
levels <- as.numeric(unlist(strsplit(levels_line, ":"))[-(1:2)])

# Convert the tab-separated values to a numeric matrix
data_matrix <- as.matrix(read.table(text = data_lines, sep = "\t"))

# Plot each waveform based on decibel levels
plot_colors <- rainbow(ncol(data_matrix))

plot(1, type = "n", xlim = c(1, nrow(data_matrix)), ylim = range(data_matrix), 
     xlab = "Data Point Index", ylab = "Decibel Level", 
     main = "Graph of Selected Data")

for (i in 1:ncol(data_matrix)) {
  waveform <- data_matrix[, i]
  lines(waveform, type = "l", col = plot_colors[i], lwd = 1)
}

# Add legend for decibel levels
legend("topright", legend = levels, col = plot_colors, lwd = 1, bty = "n", title = "Decibel Levels")
# In this code:
#   
#   We extract the decibel levels from the metadata line containing ":LEVELS".
# Each waveform is plotted with a different color, and the decibel levels are used as labels in the legend.
# Please try running this code and let me know if it produces the desired plot. If there are any further adjustments needed or if you encounter any issues, feel free to let me know!