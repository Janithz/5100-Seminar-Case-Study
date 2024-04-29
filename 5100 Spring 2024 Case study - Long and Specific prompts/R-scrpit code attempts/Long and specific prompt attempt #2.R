# Read the file line by line
lines <- readLines("ABR-0-1.txt")

# Initialize a list to store corrected lines
corrected_lines <- list()

# Loop through each line
for (line in lines) {
  # Split the line into elements
  elements <- unlist(strsplit(line, "\\s+"))  # Assuming elements are separated by whitespace
  
  # Check if the line has exactly 8 elements
  if (length(elements) == 8) {
    # If it has 8 elements, add it to the corrected_lines list as is
    corrected_lines <- c(corrected_lines, line)
  } else {
    # If it doesn't have 8 elements, fix it by adding or removing elements
    if (length(elements) < 8) {
      # Add additional elements to make it 8
      missing_elements <- 8 - length(elements)
      corrected_line <- paste(elements, rep("0", missing_elements), collapse = " ")
    } else {
      # Remove excess elements to make it 8
      corrected_line <- paste(elements[1:8], collapse = " ")
    }
    # Add the corrected line to the list
    corrected_lines <- c(corrected_lines, corrected_line)
  }
}

# Write the corrected lines back to the file
writeLines(corrected_lines, "ABR-0-1_corrected.txt")
