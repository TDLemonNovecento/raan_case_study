#install all necessary packages
install.packages("ggplot2")
install.packages("network")
install.packages("sna")
install.packages("GGally")#uses ggplot2, network and sna
install.packages("visNetwork")
install.packages("readxl")
install.packages("rstudioapi")
install.packages("tidyverse")



#set working directory to same directory as this file is located
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
working_directory = getwd()
print(paste("working directory is now set to: ", working_directory))

#define filepath to variables.py file
python_path = "variables.py"
content=file(python_path, open="r")
content_bylines = readLines(content)

#define variables as set in variables.py file
#If the file cannot be found, please paste the filepath directly to the variable
#xlsx_filepath
extended_variable_values = sub(".*=", "", content_bylines)
xlsx_filepath <- strsplit(extended_variable_values[1], "\"")[[1]][[2]]
edge_sheet_name <- strsplit(extended_variable_values[2], "\"")[[1]][[2]]
node_sheet_name <- strsplit(extended_variable_values[3], "\"")[[1]][[2]]

path_store_2d <- strsplit(extended_variable_values[5], "\"")[[1]][[2]]
path_store_3d <- strsplit(extended_variable_values[6], "\"")[[1]][[2]]

print(paste("The xlsx file to be processed is ", xlsx_filepath))
print(paste("nodes are extracted from sheet ", node_sheet_name))
print(paste("edges are extracted from sheet ", edge_sheet_name))
print("If any of this is not correct, either change in variables.py file
      or directly in R file on lines 22-24")


#open xlsx file and read data to variables
library(readxl)

data_nodes <- read_excel(xlsx_filepath, sheet=node_sheet_name)
data_edges <- read_excel(xlsx_filepath, sheet=edge_sheet_name)

#create graph network for plotting
library(network)

#prepare edge data
library(tidyverse)
edge_list <- tibble(from = data_edges$source_id, to = data_edges$target_id)

node_list<-data.frame(no = seq(length(data_nodes$node_id)),
                      node_id = data_nodes$node_id)


#alternatively mutate() may be used, but this works, so I did it this way
from_edges = left_join(edge_list, node_list, by = c("from" = "node_id"))
edge_list <- tibble(from = from_edges$no, to = from_edges$to)
to_edges = left_join(edge_list, node_list, by = c("to" = "node_id"))
edge_list <- tibble(from = to_edges$from, to = to_edges$no, weight = data_edges$weights)


#initialize with correct no. of vertices(no of nodes)
my_network = network.initialize(n = length(data_nodes$node_id),
                                directed = TRUE, hyper = FALSE,
                                multiple = FALSE, bipartite = FALSE)



#add node names
network.vertex.names <- data_nodes$node_id

#add node attributes
set.vertex.attribute(my_network, "color", data_nodes$node_color)

#add node attributes
set.vertex.attribute(my_network, "name", data_nodes$node_label)

#add edges
add.edges(my_network,
          tail = edge_list$from,
          head = edge_list$to)

set.edge.attribute(my_network, "weight", data_edges$weights)

#check if network is setup right (control edge and node count e.g.)
summary.network(my_network, # the network we want to look at
                print.adj = FALSE # if TRUE then this will print out the whole adjacency matrix.
)


#plot with ggnet
library(GGally)
library(network)
library(sna)
library(ggplot2)

#save file to file_r_2dplot variable from variables.py file
svg(path_store_2d)

#plot graph
ggnet2(my_network,
       node.alpha = 0.8,
       label = data_nodes$node_label,
       label.size = 3,
       node.color = "color",
       node.size = 20,
       arrow.size = 5, arrow.gap = 0.05, vjust = 0.5,
       edge.size = 0.2*get.edge.value(my_network, "weight"),
)
#close file
dev.off()



#for interactive 3D plot (data needs to be prepared first)
library(visNetwork)

#prepare data, probably too bulky
#could directly use data_nodes ect. but it works
nodes <- data.frame(id = data_nodes$node_id,
                    label = data_nodes$node_label,
                    color = data_nodes$node_color)
edges <- data.frame(from = data_edges$source_id,
                    to = data_edges$target_id,
                    width = data_edges$weights)

network3D <- visNetwork(nodes, edges, width = "100%") %>%
   visEdges(arrows ="to")%>%
   visInteraction(navigationButtons = TRUE) %>%
   visInteraction(hover = T) 

print(network3D)

#save interactive html document
visSave(network3D, path_store_3d, selfcontained = TRUE, background = "white")












