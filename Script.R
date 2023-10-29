# Install and or load packages - set variables ---------------------------------
packages <- c("pdftools","reticulate")

installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

library(pdftools)
library(reticulate)
library(TheOpenAIR)
library(ds4psy)
library(glue)
library(factoextra)

# Initialize virtual ENV for Python
Sys.setenv(RETICULATE_PYTHON_ENV = "py_backend")

version <- "3.11"
virtualenv_create(python = virtualenv_starter(version))
virtualenv_install(requirements = "requirements.txt")
use_virtualenv("py_backend")

# Get your python file
source_python("aa_tokenizer.py")
source_python("aa_summarization.py")
source_python("aa_embedding.py")

outputpath = getwd()
inputpath = "Testfiles/1.pdf"
token = ""

################################################################################
# Short text summarization
################################################################################
# Load PDF file and parse ------------------------------------------------------
txt = pdf_text(inputpath)
document = txt[2] # select the page you want to summarize 

# Call Aleph Alpha API ---------------------------------------------------------
maximum_tokens = 170
summary = summary(token, document, as.integer(maximum_tokens))
summary

################################################################################
# Long text summarization
################################################################################
# Load PDF file and parse ------------------------------------------------------
# This step can be optimized by checking better OCR parsing libraries or adding procedures beforehand
txt = pdf_text(inputpath)

maximum_tokens = 74

# processing of PDF file to text
stringtosum = ""
for (x in 1:length(txt)) {
  stringtosum = paste(stringtosum, txt[x], sep = " ", collapse = " ")
}    

sumtokeninput = count_tokens(stringtosum)

# count tokens per page and total
dft = data.frame(page="", tokens="")
x = 1
for (x in 1:length(txt)) {
  string = gsub("[\r\n]", "", txt[i]) # remove new lines
  #tokens = aa_tokenizer(token, string)
  tokens = count_tokens(string) 
  tupel = as.integer(c(x, tokens))
  dft = rbind(dft, tupel)
} 
dft = dft[-1,]

dft$tokens <- as.integer(dft$tokens)  
sumtokeninput <- sum(dft[, 'tokens'])

# Chunking algorithm -----------------------------------------------------------
string = paste(txt, sep="", collapse="")
string = gsub("[\r\n]", "", string) # remove new lines

dftext = text_to_sentences(string, split_delim = "\\.")  # only split at "."
dftext = as.data.frame(dftext)
colnames(dftext) = "chunks"

chunksize = 5
overlap = 1
cutsize = chunksize - overlap
iterations = round(nrow(dftext)/cutsize)-1

df = data.frame(matrix(nrow = 0, ncol = 0))

for (x in 1:iterations){
  chunk = paste(dftext[c(1:chunksize),], sep="", collapse="")
  df = rbind(df, chunk)
  dftext = as.data.frame(dftext[-c(1:cutsize), ])
}

if (nrow(dftext) > 0) { 
  chunk = paste(dftext[c(1:nrow(dftext)),], sep="", collapse="")
  df = rbind(df, chunk)
}

colnames(df) <- c("Text_chunk")

text_chunks = as.list(df[,1]) 

vectors = embedding(token, text_chunks) 
vectors
vectors = matrix(unlist(vectors), ncol = 5120, byrow = TRUE)

fviz_nbclust(vectors, kmeans, method = "silhouette") +
  geom_vline(xintercept = "", linetype = 2)

# Clustering algorithm ---------------------------------------------------------
# Presummary -------------------------------------------------------------------
set.seed(123)
groupsize = 2
km.res <- kmeans(vectors, groupsize, nstart = 25)

df2 <- cbind(df, cluster = km.res$cluster) 

presummarydf = data.frame(matrix(nrow = 0, ncol = 0))

for (x in 1:nrow(df2)) {
  document = df2[x,1]
  source_python("aa_summarization.py")
  summary = summary(token, document, as.integer(maximum_tokens))
  print(summary)
  presummarydf = rbind(presummarydf, summary)
}

for (x in 1:nrow(presummarydf)) {
  stringtosum = paste(stringtosum, presummarydf[x,1], sep = " ", collapse = " ")
} 

sumtokenoutput = 0
sumtokenoutput = sumtokenoutput + count_tokens(stringtosum)

df2 <- cbind(df2, presummarydf) 
colnames(df2) <- c("Text_chunk", "cluster", "Summary")

# Create summary per cluster --------------------------------------------------- 
clustersummarydf = data.frame(matrix(nrow = 0, ncol = 0))
x = 0
for (x in 1:groupsize) {
  #x = 2
  group = df2[df2$cluster == x,]
  
  document = ""
  stringtosum = ""
  
  for (y in 1:nrow(group)) {
    stringtosum = paste(stringtosum, group[y,3], sep = " ", collapse = " ")
    document = stringtosum
  }        
  clustersummarydf = rbind(clustersummarydf, document)
}  
colnames(clustersummarydf) <- c("Clustersummary")

finalsummarydf = data.frame(matrix(nrow = 0, ncol = 0))
maximum_tokens = 350
for (x in 1:nrow(clustersummarydf)) {
  document = clustersummarydf[x,1]
  source_python("aa_summarization.py")
  summary = summary(token, document, as.integer(maximum_tokens))
  print(summary)
  finalsummarydf = rbind(finalsummarydf, summary)
}
colnames(finalsummarydf) <- c("Finalsummary")
finalsummarydf[1,1]

# Guided summary ---------------------------------------------------------------
document = ""
stringtosum = ""
for (x in 1:nrow(clustersummarydf)) {
  stringtosum = paste(stringtosum, clustersummarydf[x,1], sep = " ", collapse = " ")
  document = stringtosum
}        

maximum_tokens = 350

question1 = "Was ist der Hintergrund?"
source_python("aa_summarization_guided.py")
background = summaryguided(token, document, question1, as.integer(maximum_tokens))
background  
  
question2 = "Ist das Urteil aus Sicht der Krankenkasse für die Abrechnungsprüfung relevant? Ist der Rechnungsbetrag zu kürzen? Wenn ja, aus welchem Grund?"
resolution = summaryguided(token, document, question2, as.integer(maximum_tokens))
resolution
  
guidedsummary = data.frame(matrix(nrow = 0, ncol = 3))
vector1 = cbind("Background", question1, background)
vector2 = cbind("Resolution", question2, resolution)

df3 = as.data.frame(rbind(vector1, vector2))
colnames(df3) <- c("Part","Question","Summary")

# Cost evaluation --------------------------------------------------------------
#summary = glue("BACKGROUND: {background} RESOLUTION: {resolution}")
#  sumtokeninput = sumtokeninput + count_tokens(document)
#  sumtokenoutput = sumtokenoutput + count_tokens(document) + count_tokens(background) + count_tokens(resolution) 
