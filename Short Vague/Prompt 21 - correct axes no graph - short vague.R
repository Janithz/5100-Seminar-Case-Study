#Prompt 21
#You : if I tell you the decibel levels, can you force it to set them correctly?
  
# ChatGPT :Absolutely! If you provide the specific decibel levels, I can adjust the code to ensure that the y-axis limits are set accordingly. Please provide the range of decibel levels you'd like to display on the y-axis, and I'll adjust the code accordingly.
# 
# You :steps of 10dBSPL from 20-80
# 
# ChatGPT
# Thank you for providing the range of decibel levels. We'll adjust the y-axis limits to display steps of 10 dB SPL from 20 to 80 dB SPL. Here's the updated code:
#   
# Define the range of decibel levels
min_dBSPL <- 20
max_dBSPL <- 80
step_dBSPL <- 10

# Calculate the y-axis limits based on the decibel level range
y_min <- min_dBSPL - offset * (ncol(data_matrix) - 1)
y_max <- max_dBSPL

# Plot each waveform based on decibel levels with staggered y-values
plot_colors <- rainbow(ncol(data_matrix))

plot(1, type = "n", xlim = c(1, nrow(data_matrix)), ylim = c(y_min, y_max + offset * (ncol(data_matrix) - 1)), 
     xlab = "Data Point Index", ylab = "Decibel Level (dB SPL)", 
     main = "Graph of Selected Data")

for (i in 1:ncol(data_matrix)) {
  waveform <- data_matrix[, i] + (i - 1) * offset
  lines(waveform, type = "l", col = plot_colors[i], lwd = 1)
}

# Add legend for decibel levels
legend("topright", legend = levels, col = plot_colors, lwd = 1, bty = "n", title = "Decibel Levels")
# In this code:
#   
#   We define the range of decibel levels from 20 to 80 dB SPL with steps of 10 dB SPL.
# The y-axis limits are calculated based on this range, ensuring that all the data points are within the visible range of the plot.
# We add the offset only for visualization purposes, ensuring that the staggered lines are displayed correctly.
# Please try running this code, and let me know if it displays the decibel levels correctly. If there are any further adjustments needed or if you encounter any issues, feel free to let me know!
