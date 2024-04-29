ARG R_VERSION="4.3"

# Fetch base image
FROM rocker/rstudio:$R_VERSION

# Set up workspace and copy dependencies
WORKDIR /workspace
COPY ./DESCRIPTION /workspace/

# Install dependencies 
RUN R -e 'options(repos = c("https://cran.r-project.org")); \
        install.packages("remotes"); \
        remotes::install_local(path = ".", force = FALSE, dependencies = TRUE, upgrade = FALSE)'