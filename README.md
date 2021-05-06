# raan_case_study
Visualization of nodes from .xlsx file and web application

!!Attention: The paths to images ect. were specified on Windows 10, please be careful and expect errors if running on another system!!
(Python application works since only relative paths are used)

Please open the web_app_raan.html document with any available webbrowser (Firefox, Chrome, edge) to view its content.
Examples of the visualizations contained within this repository were embedded.

To run the visualizations, please specify the filepath of an .xlsx file in the "variables.txt" file under "filepath".

Images can be generated either with python using the plot_python.py file or with R using the plot_R.R file
They are exported to the filenames specified in the variables.py file under

outfile_2dplot (python outfile for 2D plot)
outfile_R_2dplot (R outfile for 2D plot)
outfile_R_3dplot (R outfile for 3D plot)

Please note that the "web_app_raan.html" application relies on the filepaths specified to the "Images" folder.
If you want to replace these images by your own images, either replace the files in the "Images" folder or substitute
the paths in the "web_app_raan.html" file.

Specifications for the Python and R implementation are given below

##################################################################
python Specifications
##################################################################

This code was run with:
python 3.6
packages:

#############################################################
R Specifications
#############################################################
R 3.5 or higher (required for sna package)
All packages are specified at the top of the document and should automatically install

The following packages are used to prepare data and setup R:
-rstudioapi
-readxl
-tidyverse
Packages for 2D plot:
-GGally (requires sna, ggplot2 and network)
Package for 3D plot:
-visNetwork

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
