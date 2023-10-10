# Install and or load packages - set variables ---------------------------------
packages <- c("pdftools","reticulate")

installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

library(pdftools)
library(reticulate)

# Initialize virtual ENV for Python
Sys.setenv(RETICULATE_PYTHON_ENV = "py_backend")

version <- "3.11"
virtualenv_create(python = virtualenv_starter(version))
virtualenv_install(requirements = "requirements.txt")
use_virtualenv("py_backend")

# Get your python file
source_python("aa_summarization.py")

token = "YOUR TOKEN"

# Load PDF file and parse ------------------------------------------------------
pdf_file = "Testfile.pdf"
txt = pdf_text(pdf_file)
document = txt[2] # select the page you want to summarize --------> SEITE SETZEN

# Call Aleph Alpha API ---------------------------------------------------------
summary = summary(token, document)
summary

