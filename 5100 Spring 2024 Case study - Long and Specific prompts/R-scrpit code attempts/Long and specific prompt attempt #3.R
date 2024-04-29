# Load corrected ABR data
ABR <- read.table("ABR-0-1_corrected.txt")

# Calculate size of ABR data
s <- dim(ABR)[1]
fr <- 40
frame <- 1:s

# Final Figure
plot(NA, xlim = c(-5, 12.4), ylim = c(1.3, 33.1), xlab = "", ylab = "", main = "ABR Data")

for (i in 1:dim(ABR)[2]) {
  lines(frame/fr, ABR[, i] + (i * 4), col = "black", lwd = 1)
}

box()
axis("off")
