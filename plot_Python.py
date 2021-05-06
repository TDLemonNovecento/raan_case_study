import os
import matplotlib.pyplot as plt
import pandas as pd
import networkx as nx

#import variables
from variables import *



#check if .xlsx file is available
try:
    f = open(filepath)
except IOError:
    print(".xlsx file not accessible, check filepath in variables.txt file")
finally:
    f.close()


#read excel file to pandas dataframe
edges = pd.read_excel(r'%s' %filepath, sheet_name = '%s' %edge_sheet_name)
nodes = pd.read_excel(r'%s' %filepath, sheet_name = '%s' %node_sheet_name)


#create edge graph
G = nx.from_pandas_edgelist(edges, source = "source_id",\
    target = "target_id", create_using=nx.Graph())

#add nodes
G.add_nodes_from(nodes.node_id)
    
#add labels
pos = nx.spring_layout(G)
labels = {nodes['node_id'][i]: nodes['node_label'][i] for i in range(len(nodes['node_id']))}

#draw nodes and edges
nx.draw(G, with_labels = False, node_color = nodes['node_color'],\
    width = edges['weights'], edge_color = 'gray')
    
#add node name
nx.draw_networkx_labels(G, pos, labels)

#save figure
plt.savefig(outfile_2dplot)

print("figure has been saved to %s" %outfile_2dplot)

return()
