# raan_case_study
Visualization of nodes from .xlsx file and web application

To run this application, please specify the filepath of an .xlsx file in the "variables.txt" file under "filepath".

Either install required python packages or run conda virtual environment as specified in "xlsx_case". For this, copy the "xlsx_case" folder to the "envs" folder on your computer, e.g. as "anaconda3/envs/xlsx_case"

This code was run with:
python 3.6
R
packages:
rpgy
r-ggplot2





############################################################
Details below
############################################################
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
