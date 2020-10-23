library(ape)
library(phytools)
library(tidyverse)
library(RColorBrewer)
library(ggtree)
library(deeptime)
BYTree <- read.tree("rooted_smoothed_hakim.tre")
BYTree$root.time <- 485

q = ggtree(BYTree, branch.length="TREE", position = position_nudge(x =-1 * BYTree$root.time)) +
  coord_geo(xlim = c(-490,500), ylim = c(.95,Ntip(BYTree)), neg = TRUE, expand = 5) +
  geom_tiplab(size = 2, align=TRUE, hjust = 1.10) +
  scale_x_continuous(breaks=seq(-485,-25,50), labels=abs(seq(-485,-25,50))) +
  labs(caption="Divergence time using R8s") + theme_tree2(plot.margin=margin(5, 5, 5, 5))

ggsave("BY_TimeTree_hakim.pdf",q,width=8)
