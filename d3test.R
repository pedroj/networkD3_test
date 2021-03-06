# A test of Christopher Gandrud code for d3Network.
# Pedro Jordano. Sevilla. 8-11 Sept 2014l.
# Load the d3Network code from github
devtools::install_github("d3Network", "christophergandrud", ref = "sankey")
library(d3Network)

# Load energy projection data
library(RCurl)

# Path to the json data file.
# I converted the initial weighted adjacency matrix for HR to a json 
# data file. First I vectorized the matrix; then I re-labelled the 
# node names and links to match a json input file format.
# This needs to be imporved by implementing a function to auto re-code
# the input matrix.
# This is the Hato Raton dataset.
URL<- "file:///Users/pedro/Documents/Working/~RCode/MyRCode/networks/d3Network_test/hr.json"

hr<- getURL(URL, ssl.verifypeer = FALSE)
hrLinks <- JSONtoDF(jsonStr = hr, array = "links")
hrNodes <- JSONtoDF(jsonStr = hr, array = "nodes")
# Plot
# Open the TestHR.html in the browser.
d3Sankey(Links = hrLinks, Nodes = hrNodes, Source = "source",
         Target = "target", Value = "value", NodeID = "name"
         , fontsize = 12, nodeWidth = 30, file = "TestHR.html")

# This is the Nava Correhuelas dataset.
URL<- "file:///Users/pedro/Documents/Working/~RCode/MyRCode/networks/d3Network_test/nch.json"

nch<- getURL(URL, ssl.verifypeer = FALSE)
nchLinks <- JSONtoDF(jsonStr = nch, array = "links")
nchNodes <- JSONtoDF(jsonStr = nch, array = "nodes")
# Plot
# Open the TestHR.html in the browser.
d3Sankey(Links = nchLinks, Nodes = nchNodes, Source = "source",
         Target = "target", Value = "value", NodeID = "name"
         , fontsize = 12, nodeWidth = 30, file = "TestNCH.html")
