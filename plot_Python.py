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


#create directed edge graph
G = nx.from_pandas_edgelist(edges, source = "source_id",\
    target = "target_id", create_using=nx.DiGraph())

#add nodes
G.add_nodes_from(nodes.node_id)



#set size of plot
plt.figure(figsize=(12, 12))

#prepare labels
pos = nx.shell_layout(G)
labels = {nodes['node_id'][i]: nodes['node_label'][i] for i in range(len(nodes['node_id']))}
edge_labels={(edges['source_id'][i], edges['target_id'][i]): edges['weights'][i] for i in range(len(edges['weights']))}


#draw networkx plot
nx.draw_networkx_nodes(G,pos, node_size = 0.5*nodes['node_id'],\
        node_color = nodes['node_color'])
    
nx.draw_networkx_labels(G, pos, labels)
nx.draw_networkx_edge_labels(G, pos, edge_labels = edge_labels, font_color = 'lightblue')
nx.draw_networkx_edges(G, pos, edge_color = 'lightblue')


#save figure
plt.axis('off')
plt.savefig(outfile_2dplot)

print("figure has been saved to %s" %outfile_2dplot)


