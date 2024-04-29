#Prompt 20
#You
# that pushed all the data off the axis
# 
# ChatGPT
# ChatGPT
# I see. It seems that adjusting the y-axis limits based on the staggered lines caused the data to be pushed off the axis. Let's try a different approach to ensure that both the staggered lines and the decibel levels are displayed correctly.
# 
# Instead of adjusting the y-axis limits based on the staggered lines, we can calculate the range of the data matrix without considering the offset. This will ensure that all the data points are within the visible range of the plot. We can then add the offset only for visualization purposes.
# 
# Here's the updated code:
  

# Extract decibel levels from the metadata
levels_line <- ABRtext[grep(":LEVELS", ABRtext)]
levels <- as.numeric(unlist(strsplit(levels_line, ":"))[-(1:2)])

# Convert the tab-separated values to a numeric matrix
data_matrix <- as.matrix(read.table(text = data_lines, sep = "\t"))

# Define an offset for staggering the lines
offset <- 0.5

# Determine the range of the data matrix without considering the offset
y_min <- min(data_matrix)
y_max <- max(data_matrix)

# Plot each waveform based on decibel levels with staggered y-values
plot_colors <- rainbow(ncol(data_matrix))

plot(1, type = "n", xlim = c(1, nrow(data_matrix)), ylim = c(y_min, y_max + offset * (ncol(data_matrix) - 1)), 
     xlab = "Data Point Index", ylab = "Decibel Level", 
     main = "Graph of Selected Data")

for (i in 1:ncol(data_matrix)) {
  waveform <- data_matrix[, i] + (i - 1) * offset
  lines(waveform, type = "l", col = plot_colors[i], lwd = 1)
}

# Add legend for decibel levels
legend("topright", legend = levels, col = plot_colors, lwd = 1, bty = "n", title = "Decibel Levels")
# In this code:
#   
#   We calculate the range of the data matrix without considering the offset.
# The y-axis limits are set based on this range, ensuring that all the data points are within the visible range of the plot.
# We add the offset only for visualization purposes, ensuring that the staggered lines are displayed correctly.
# Please try running this code and let me know if it resolves the issue. If there are any further adjustments needed or if you encounter any issues, feel free to let me know!