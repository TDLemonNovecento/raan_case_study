# raan_case_study
Visualization of nodes from .xlsx file and web application

To run this application, please specify the filepath of an .xlsx file in the "variables.txt" file under "filepath".

Images Can be generated either with python using the plot_Python.py file or with R using the plot_R.R file
They are exported to the filenames specified in the variables.py file under

outfile_2dplot (python outfile for 2D plot)
outfile_R_2dplot (R outfile for 2D plot)
outfile_R_3dplot (R outfile for 3D plot)

These are the same filepaths that are used in the web_app_raan.html application.

Example plots as visualized By Me are included in the Images folder. These are shown as default in the HTML document.

Please open the web_app_raan.html document with any available webbrowser (Firefox, Chrome, edge) to view its Content.

Specifications for the Python and R implementation are given below

##################################################################
python Specifications
##################################################################

This code was run with:
python 3.6

#############################################################
R Specifications
#############################################################
R 3.5 or higher (required for sna package)
All packages are specified at the top of the document and should Automatically Install





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
