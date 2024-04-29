#PROMPT12 
#You
# and now we are back at the problem that it can't read the data formatting
# 
# ChatGPT
# I see. It seems the issue lies in the way the data is formatted or read in R. Let's try a different approach to read the data, ensuring it's compatible with the MATLAB script. We'll use the read.table function with appropriate arguments to match the formatting of your data file.
# 
# Assuming your data file is tab-separated and has a header row, we can adjust the code as follows:
#   
# # Load ABR row data
# ABRtext <- read.table('ABR-0-1.txt', header = TRUE, sep = '\t')
# 
# # Extract ABR data
# ABR <- as.matrix(ABRtext$data)
# 
# # Get dimensions of ABR data
# s <- dim(ABR)
# fr <- 40
# frame <- 1:s[1]
# 
# # Final Figure
# plot_colors <- rainbow(s[2])
# 
# plot(frame / fr, ABR[, 1] + (1 * 4), type = 'l', col = plot_colors[1], lwd = 1,
#      xlim = c(-5, 12.4), ylim = c(1.3, 33.1), xlab = 'Time (s)', ylab = 'Y-axis label')
# 
# for (i in 2:s[2]) {
#   lines(frame / fr, ABR[, i] + (i * 4), col = plot_colors[i], lwd = 1)
# }
# 
# box()
# axis(1, at = NA)
# axis(2, at = NA)

#This code assumes that your data file is tab-separated and has a header row specifying column names. Adjust the sep argument if your data file is separated by a different character. If you encounter any further issues or if your data file has a different structure, please provide more details, and I'll adjust the code accordingly!

#Prompt 13
#You
#you've seen how my data is formatted. does that assumption hold?
  
# ChatGPT
# You're correct; I should have considered the actual format of your data. Let's revise the code to match the format you provided earlier:
#   
# Read the file line by line
ABRtext <- readLines('ABR-0-1.txt')

# Find the index of the line containing the ":DATA" marker
data_start_index <- grep(":DATA", ABRtext)

# Extract numerical data from lines after the ":DATA" marker
data_lines <- ABRtext[(data_start_index + 1):length(ABRtext)]

# Convert the tab-separated values to a numeric matrix
data_matrix <- as.matrix(read.table(text = data_lines))

# Plot each waveform based on levels
plot(data_matrix, type = "l", col = "black", lwd = 1, 
     xlab = "Data Point Index", ylab = "Data Value",
     main = "Graph of Selected Data")
#This code should correctly read in the data as it is formatted in your file and plot each waveform accordingly. If there are any adjustments needed or if you encounter any issues, please let me know!