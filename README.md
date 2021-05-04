# raan_case_study
Visualization of nodes from .xlsx file and web application

To run this application, please copy an .xlsx file containing three columns of data points into the same folder as this README file is located in.

The following structure of the .xlsx file is set as standard:

The .xlsx file contains two sheets, one labeled "nodes", one "edges".

"edges_sheet" specs:
row 1: contains column titles, these are used to reference the columns

column 1: source ID (variable "source_id")
column 2: target ID (variable "target_id")
column 3: weights (variable "weights")

"nodes_sheet" specs:
row 1: contains column titles, these are used to reference the columns

column 1: node ID (variable "node_id")
column 2: node color (variable "node_color")
column 3: node label (variable "node_label")
