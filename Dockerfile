FROM rocker/rstudio:4.0.3

# Install R packages
## bupaR
RUN R -e "install.packages('bupaR', repos='https://cloud.r-project.org/')"
## edeaR
RUN R -e "install.packages('edeaR', repos='https://cloud.r-project.org/')"
## eventdataR
RUN R -e "install.packages('eventdataR', repos='https://cloud.r-project.org/')"
## processmapR
RUN R -e "install.packages('processmapR', repos='https://cloud.r-project.org/')"
## processmonitR
RUN R -e "install.packages('processmonitR', repos='https://cloud.r-project.org/')"
## xesreadR
RUN R -e "install.packages('xesreadR', repos='https://cloud.r-project.org/')"
## petrinetR
RUN R -e "install.packages('petrinetR', repos='https://cloud.r-project.org/')"

