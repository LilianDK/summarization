# Install and or load packages - set variables ---------------------------------
packages <- c("pdftools","reticulate","glue")

installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

library(pdftools)
library(reticulate)

# Put the path to your python environment here 
use_python("/Users/<<USERNAME>>/.pyenv/versions/3.11.4/bin/python") #   --------> PYTHON ENV SETZEN

py_install("aleph-alpha-client")
py_install("Jinja2")

# Get your python file
source_python("aa_summarization.py")

token = ""                                                            # --------> TOKEN SETZEN

# Load PDF file and parse ------------------------------------------------------
pdf_file = "Testfile.pdf"
txt = pdf_text(pdf_file)
document = txt[2] # select the page you want to summarize               --------> SEITE SETZEN

# Call Aleph Alpha API ---------------------------------------------------------
summary = summary(token, document)
summary