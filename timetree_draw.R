library(ape)
library(phytools)
library(tidyverse)
library(RColorBrewer)
library(ggtree)
library(deeptime)
BYTree <- read.tree("Friedmannomyces.r8s.LONG.tre")
BYTree$root.time <- 485
p = ggtree(BYTree,branch.length="TREE",
           position = position_nudge(x =-1 * BYTree$root.time)) +
  geom_tiplab(align=TRUE, linesize=.5) + 
  coord_geo(xlim = c(-485,0), ylim = c(.75,Ntip(BYTree)), neg = TRUE) +
  scale_x_continuous(breaks=seq(-485,200,50), labels=abs(seq(-485,200,50))) +
	theme_tree2()
p

ggsave("BY_TimeTree.pdf",p,width=8)
