\name{est.IDR}
\alias{est.IDR}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimate the irreproducible discovery rate using the copula mixture model
}
\description{
  Fit a Gaussian copula mixture model. 
}
\usage{
est.IDR(x, mu, sigma, rho, p, eps=0.001, max.ite=30)
}
\arguments{
  \item{x}{an n by m numeric matrix, where m= num of replicates,
    n=num of observations. Numerical values representing the
    significance of the observations. Note that significant signals 
    are expected to have large values of x. In case that smaller values
    represent higher significance (e.g. p-value), a monotonic transformation 
    needs to be applied to reverse the order before using this function, 
    for example, -log(p-value). Currently, m=2. }
  \item{mu}{ a starting value for the mean of the reproducible component.}
  \item{sigma}{ a starting value for the standard deviation of the
    reproducible component.}
  \item{rho}{ a starting value for the correlation coefficient of the
    reproducible component.}
  \item{p}{ a starting value for the proportion of reproducible component.}
  \item{eps}{ Stopping criterion. Iterations stop when the increment of
    log-likelihood is < eps*log-likelihood, Default=0.001.}
  \item{max.ite}{ Maximum number of iterations. Default=30.}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
  \item{para}{ estimated parameters: p, rho, mu, sigma.}
  \item{idr}{ a numeric vector of the local idr for each observation (i.e.
    estimated conditional probablility for each observation to belong to
    the irreproducible component.}
  \item{IDR}{a numerical vector of the expected irreproducible discovery
  rate for observations that are as irreproducible or more
  irreproducible than the given observations.}
  \item{loglik}{ log-likelihood at the end of iterations.}
  \item{loglik.trace}{ trajectory of log-likelihood. }
}
\references{
  Q. Li, J. B. Brown, H. Huang and P. J. Bickel. (2011)
   Measuring reproducibility of high-throughput experiments. Annals of Applied Statistics, Vol. 5, No. 3, 1752-1779.

}
\author{
Qunhua Li
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
data("simu.idr")

# simu.idr$x and simu.idr$y are p-values
# Transfer them such that large values represent significant ones 
x <- cbind(-simu.idr$x, -simu.idr$y)

mu <- 2.6
sigma <- 1.3
rho <- 0.8
p <- 0.7

idr.out <- est.IDR(x, mu, sigma, rho, p, eps=0.001, max.ite=20)

names(idr.out)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Statistical Models}
% __ONLY ONE__ keyword per line
