# Prompt 19
#You
#waveforms look great. the decibel levels look like they aren't correct though
# 
# ChatGPT
# ChatGPT
# If the decibel levels appear incorrect, it could be due to the offset applied to the y-values of the waveforms. This offset is intended to stagger the lines vertically but might affect the appearance of the decibel levels.
# 
# To address this issue, we can adjust the y-axis limits to ensure that the decibel levels are displayed accurately, regardless of the staggered lines. Here's how we can modify the code:

# Extract decibel levels from the metadata
levels_line <- ABRtext[grep(":LEVELS", ABRtext)]
levels <- as.numeric(unlist(strsplit(levels_line, ":"))[-(1:2)])

# Convert the tab-separated values to a numeric matrix
data_matrix <- as.matrix(read.table(text = data_lines, sep = "\t"))

# Define an offset for staggering the lines
offset <- 0.5

# Plot each waveform based on decibel levels with staggered y-values
plot_colors <- rainbow(ncol(data_matrix))

# Determine the y-axis limits
y_min <- min(data_matrix) - offset * (ncol(data_matrix) - 1)
y_max <- max(data_matrix)

plot(1, type = "n", xlim = c(1, nrow(data_matrix)), ylim = c(y_min, y_max), 
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
#   We adjust the y-axis limits to ensure that the decibel levels are displayed correctly, regardless of the staggered lines.
# Please try running this code and let me know if it resolves the issue with the incorrect appearance of the decibel levels. If there are any further adjustments needed or if you encounter any issues, feel free to let me know!
#   
  
  