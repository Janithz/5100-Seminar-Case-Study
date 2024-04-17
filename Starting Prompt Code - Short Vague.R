#PROMPT: 
# You
# given the following matlab code, give me the R code that would accomplish the same task: 

# Load ABR row data
ABRtext <- read.table('ABR-0-1.txt', header = TRUE)
ABR <- as.matrix(ABRtext)
s <- dim(ABR)
fr <- 40
frame <- 1:s[1]

# Final Figure
plot_colors <- rainbow(s[2])  # You can adjust the color palette as needed

plot(frame / fr, ABR[, 1] + (1 * 4), type = 'l', col = plot_colors[1], lwd = 1,
     xlim = c(-5, 12.4), ylim = c(1.3, 33.1), xlab = 'Time (s)', ylab = 'Y-axis label')

for (i in 2:s[2]) {
  lines(frame / fr, ABR[, i] + (i * 4), col = plot_colors[i], lwd = 1)
}

# To remove box and axis, you can use the following:
box()
axis(1, at = NA)
axis(2, at = NA)


#ERROR: 
# Error in scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  : 
#                 line 1 did not have 8 elements