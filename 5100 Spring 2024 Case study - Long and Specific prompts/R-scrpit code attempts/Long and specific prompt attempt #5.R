# Read the data from the file
data <- read.table("ABR-0-1.txt", header = FALSE, skip = 15)

# Check the structure of the data
str(data)

# Load ABR row data
ABRtext <- importdata("ABR-0-1.txt")
ABR <- ABRtext$data
s <- dim(ABR)
fr <- 40
frame <- 1:s[1]

# Final Figure
plot(NA, xlim = c(-5, 12.4), ylim = c(1.3, 33.1), xlab = "", ylab = "", main = "ABR Data")

for (i in 1:s[2]) {
  lines(frame/fr, ABR[, i] + (i * 4), col = "black", lwd = 1)
}

box()
axis("off")
