# #Prompt 18
# #You
# can you now stagger the lines
# 
# 
# ChatGPT
# ChatGPT
# To stagger the lines, we can add an offset to the y-values of each waveform. We can adjust the offset based on the index of the waveform to create a staggered effect. Here's how we can modify the code to achieve this:


# Extract decibel levels from the metadata
levels_line <- ABRtext[grep(":LEVELS", ABRtext)]
levels <- as.numeric(unlist(strsplit(levels_line, ":"))[-(1:2)])

# Convert the tab-separated values to a numeric matrix
data_matrix <- as.matrix(read.table(text = data_lines, sep = "\t"))

# Define an offset for staggering the lines
offset <- 0.5

# Plot each waveform based on decibel levels with staggered y-values
plot_colors <- rainbow(ncol(data_matrix))

plot(1, type = "n", xlim = c(1, nrow(data_matrix)), ylim = range(data_matrix) + c(0, offset * ncol(data_matrix)), 
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
# We define an offset value to stagger the lines vertically.
# Each waveform is plotted with a y-offset based on its index multiplied by the offset value.
# The y-axis limits are adjusted to accommodate the staggered lines.
# Please try running this code and let me know if it produces the desired staggered plot. If there are any further adjustments needed or if you encounter any issues, feel free to let me know!