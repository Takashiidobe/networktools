% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bridge.R
\name{bridge}
\alias{bridge}
\title{Bridge Centrality}
\usage{
bridge(
  network,
  communities = NULL,
  useCommunities = "all",
  directed = NULL,
  nodes = NULL,
  normalize = FALSE
)
}
\arguments{
\item{network}{a network of class "igraph", "qgraph", or an adjacency matrix representing
a network}

\item{communities}{an object of class "communities" (igraph) OR a character vector of
community  assignments for each node (e.g., c("Comm1", "Comm1", "Comm2", "Comm2)).
The ordering of this vector should correspond to the vector from argument "nodes".
Can also be in list format (e.g., list("Comm1"=c(1:10), "Comm2"=c(11:20)))}

\item{useCommunities}{character vector specifying which communities should be included. Default set to "all"}

\item{directed}{logical. Directedness is automatically detected if set to "NULL" (the default).
Symmetric adjacency matrices will be undirected, asymmetric matrices will be directed}

\item{nodes}{a vector containing the names of the nodes. If set to "NULL", this vector will
be automatically detected in the order extracted}

\item{normalize}{logical. Bridge centralities are divided by their highest possible value (assuming max edge strength=1)
in order to normalize by different community sizes}
}
\value{
\code{\link{bridge}} returns a list of class "\code{bridge}" which contains:

$'Bridge Strength'

$'Bridge Betweenness'

$'Bridge Closeness'

$'Bridge Expected Influence (1-step)'

$'Bridge Expected Influence (2-step)'

Each of these contains a vector of named centrality values

$'communities' is also returned, which returns the communities in vector format. If communities were supplied as a list or igraph object, it is advised that one check the accuracy of this vector.
}
\description{
Calculates bridge centrality metrics (bridge strength, bridge betweenness, bridge closeness, and bridge expected influence)
given a network and a prespecified set of communities.
}
\details{
To plot the results, first save as an object, and then use plot() (see ?plot.bridge)



Centrality metrics (strength, betweenness, etc.) illuminate how nodes are interconnected
among the entire network. However, sometimes we are interested in the connectivity
\emph{between specific communities} in a larger network. Nodes that are important in communication
between communities can be conceptualized as bridge nodes.

Bridge centrality statistics aim to identify bridge nodes. Bridge centralities
can be calculated across all communities, or between a specific subset of communities (as
identified by the \code{useCommunities} argument)

The bridge() function currently returns 5 centrality metrics: 1) bridge strength,
2) bridge betweenness, 3) bridge closeness, 4) bridge expected influence (1-step), and
5) bridge expected influence (2-step)

See ?plot.bridge for plotting details.

Bridge strength is defined as the sum of the absolute value of all edges that exist between a
node A and all nodes that are not in the same community as node A. In a directed network, bridge strength can be
separated into bridge in-degree and bridge out-degree.

Bridge betweenness is defined as the number of times a node B lies on the shortest path between
nodes A and C, where nodes A and C come from different communities.

Bridge closeness is defined as the inverse of the average length of the path from a node A to all nodes that are
not in the same community as node A.

Bridge expected influence (1-step) is defined as the sum of the value (+ or -) of all edges that
exist between a node A and all nodes that are not in the same community as node A. In a directed network, expected influence
only considers edges extending from the given node (e.g., out-degree)

Bridge expected influence (2-step) is similar to 1-step, but also considers the indirect effect that a node A may have
on other communities through other nodes (e.g, an indirect effect on node C as in A -> B -> C).
Indirect effects are weighted by the first edge weight (e.g., A -> B), and then added to the 1-step expected influence.
Indirect effects back on node A's own community (A -> B -> A) are not counted.

If negative edges exist, bridge expected influence should be used. Bridge closeness and bridge betweenness are only defined
for positive edge weights, thus negative edges, if present, are deleted in the calculation of these metrics. Bridge strength
uses the absolute value of edge weights.
}
\examples{
\donttest{
graph1 <- qgraph::qgraph(cor(depression))

b <- bridge(graph1, communities=c('1','1','2','2','2','2','1','2','1'))
b

}
}
