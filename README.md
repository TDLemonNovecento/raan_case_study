# raan_case_study
Visualization of nodes from .xlsx file and web application

!!Attention: The R visualisation was specified on Windows 10.
Please be careful and expect errors if running on another system.
The 3D visualization on R was also tested on Ubuntu 8
The required packages for the 2D representation could not be installed and therefore did not run on Ubuntu 8.
The Python application was only tested on Ubuntu 8, a conda environment is included for reference (raan).


If the commenting/coding style in html and R seems odd, it's because I usually only write Python XD Pardon that.
I think the data restructuring in R is inefficient/unnecessary, I've added a remark in the specific places.
Modifications to the plots can be easily achieved due to the use of network classes,
such as adding edge labels or attributes and node attributes.

How to run:
-----------

Please open the web_app_raan.html document with any available webbrowser (Firefox, Chrome, edge) to view its content.
Examples of the visualizations contained within this repository were embedded, but can be easily replaced by exchanging the source files in the "Images" folder.

To run your own visualizations, please specify the filepath of an .xlsx file in the "variables.txt" file under "filepath".
(Current example: a file named "raan_case_study interns.xlsx" located one folder upstream)

Images can be generated either with python using the "plot_Python.py" file or with R using the "plot_R.R" file
They are exported to the filenames specified in the variables.py file under

outfile_2dplot (python outfile for 2D plot)
outfile_R_2dplot (R outfile for 2D plot)
outfile_R_3dplot (R outfile for 3D plot)

Please note that the "web_app_raan.html" application relies on the filepaths specified to the "Images" folder.
If you want to replace these images by your own images, either replace the files in the "Images" folder or substitute
the paths in the "web_app_raan.html" file.

I run python using a anaconda /miniconda virtual environment.
Alternatively, download required packages directly to your computer.
I used python 3.6 and the xlrd package to extract the information from the .xlsx file, but other versions
might work too, I didn't test. Execute via "$python plot_Python.py" or your system specific equivalent.

The R environment was run on RStudio, where I installed all required packages manually (see top lines of "plot_R.R")
Code was executed line by line to catch any error warnings.
The output files are stored to the specified outfiles in the "variables.py" file, but also displayed within RStudio.


Specifications for the Python and R implementation are given below

##################################################################
python Specifications
##################################################################

This code was run with:
python 3.6
packages:
-xlrd
-pandas
-networkx
-matplotlib

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
