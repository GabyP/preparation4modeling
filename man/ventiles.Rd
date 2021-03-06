% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ventiles.R
\name{ventiles}
\alias{ventiles}
\title{ventiles}
\usage{
ventiles(tbla, targets, score_name, partition = 0.05)
}
\arguments{
\item{tbla}{table with data. It has to have the variable and the target variables.}

\item{targets}{vector with the names of the targets.}

\item{score_name}{name of the score variable.}

\item{partition}{of group: quantile 0 to 1 by partition}
}
\description{
ventiles
}
\examples{
x1 = rnorm(1000)
x2 = rnorm(1000)
z = 1 + 2 * x1 + 3 * x2
pr = 1/(1+exp(-z))
y = rbinom(1000,1,pr)
y1 = rbinom(1000,1,abs(pr-0.05))
tbla = data.frame(y=y,x1=x1,x2=x2, y1=y1)
f=formula(y~x1+x2)
lr <- glm(f, tbla, family = 'binomial')
tbla$prob<-predict(lr, tbla, type='response')
ventiles(tbla, targets=c('y', 'y1'), score_name = 'prob')
}
