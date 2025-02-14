% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_fields.R
\name{download_fields}
\alias{download_fields}
\title{Request fields data (all_fields1) from Snowflake}
\usage{
download_fields(conn, min_year = NA, max_year = NA)
}
\arguments{
\item{conn}{The connection to the Snowflake database}
}
\value{
The all_fields1 data frame.
}
\description{
Request fields data (all_fields1) from Snowflake
}
\examples{
all_fields1 <- download_crops(myconn) \%>\% filter(state \%in\% c('AZ','ID','UT'))
}
