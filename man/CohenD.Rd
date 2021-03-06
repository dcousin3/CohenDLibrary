% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CohenD.R
\name{CohenD}
\alias{CohenD}
\title{CohenD}
\usage{
CohenD(statistics, design)
CohenD(statistics, design, conf.level, method, verbose)
}
\arguments{
\item{statistics}{a list of pre-computed statistics. The statistics to report depends on the 
design (for "between": m1, m2 the means of the two groups, sd1, sd2 the standard
deviation of the two groups, and n1, n2, the sample sizes of the two groups;
for "within": m1, m2, sd1, sd2, and n; 
for "single": m, sd, n).}

\item{conf.level}{the confidence level of the confidence interval (default 0.95)}

\item{method}{name of the method to use ("lambdaprime", "pivotal", ...);}

\item{design}{the design of the measures ("within", "between", or "single");}

\item{verbose}{boolean (TRUE to display a human-readable output);}
}
\value{
the Cohen's d_p statistic and its confidence interval
}
\description{
CohenD computes the Cohen's d (noted d_p) and its confidence interval in either within-subject,
between-subject design and single-group design. For the between-subject design, MBESS already 
has an implementation based on the "pivotal" method. This method is exact for between-subject  
design but slower to compute than the "lambdaprime" method.
}
\details{
This function returns the Cohen's d_p statistics along with its confidence interval.
}
