# #PROMPT
# #you
# :RUN-1	LEVEL SWEEP	TEMP:NaN	7/28/2023	2:47 PM	HR:0.90
# :SW EAR: R	SW FREQ: 8.00	# AVERAGES: 512	REP RATE (/sec): 30	DRIVER: 	SAMPLE (?sec): 40
# :Threshold: 55.3
# :NOTES-
#   :CHAMBER-
#   :Avgs: 512;512;512;512;512;512;512
# :Tries: 747;745;765;759;752;769;758
# 
# :CFTS Version: V2.31.1 (R2280)
# :LEVELS:20;30;40;50;60;70;80;
# :DATA
# -0.110596	 -0.000493	  0.065608	  0.013715	 -0.036681	  0.235165	  0.321997
# -0.103546	 -0.016283	  0.034830	  0.005593	 -0.037403	  0.124841	  0.243001
# -0.081626	  0.021470	 -0.025705	  0.029978	 -0.026660	  0.158176	  0.334076
# -0.075919	 -0.014855	 -0.014142	  0.013486	  0.003519	  0.101401	  0.153064
# -0.054503	  0.017822	  0.026398	  0.033504	  0.044652	  0.070216	  0.045971
# -0.019804	  0.018480	  0.001176	  0.058254	  0.118445	  0.116649	  0.105762
# -0.020850	  0.008781	 -0.017010	 -0.000014	  0.083815	  0.038458	 -0.021351
# -0.066565	  0.012682	 -0.032161	  0.030085	  0.079512	 -0.003985	 -0.106448
# -0.047247	 -0.025912	 -0.042317	  0.021932	  0.067538	  0.053099	  0.061530
# -0.027776	  0.000428	 -0.027551	 -0.048434	  0.062175	  0.001463	 -0.023711
# -0.030746	  0.039731	 -0.012415	 -0.039139	  0.044295	 -0.084160	 -0.202855
# 0.000676	 -0.010109	 -0.013687	 -0.026291	  0.032465	 -0.069948	 -0.069920

#ChatGPT
# Thank you for providing the sample data. It appears that the actual data is contained after the line :DATA.
# 
# Let's modify the code to properly extract the numerical data and then plot it:
# 
#
# Read the file line by line
ABRtext <- readLines('ABR-0-1.txt')

# Find the index of the line containing the ":DATA" marker
data_start_index <- grep(":DATA", ABRtext)

# Extract numerical data from lines after the ":DATA" marker
data_lines <- ABRtext[(data_start_index + 1):length(ABRtext)]

# Convert the tab-separated values to a numeric matrix
data_matrix <- as.matrix(read.table(text = data_lines))

# Plot the extracted data
plot(data_matrix, type = "l", col = "black", lwd = 1, 
     xlab = "Data Point Index", ylab = "Data Value",
     main = "Graph of Selected Data")
#This code should correctly extract the numerical data following the :DATA marker and plot it. Let me know if you encounter any issues or if you need further assistance!


