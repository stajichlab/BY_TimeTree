library(ape)
library(phytools)
library(RColorBrewer)
library(ggtree)
library(ggplot2)
library(devtools)
install_github("willgearty/deeptime")
library(deeptime)
library(ggrepel)
library(phangorn)
library(tidytree)
library(treeio)
library(tidyverse)

BYTree <- read.tree("Friedmannomyces.r8s.LONG.tre")
is.ultrametric(BYTree) #just wanted to check
BYTree$labels.tips
BYTree$root.time <- 485
q = ggtree(BYTree, branch.length="TREE", position = position_nudge(x =-1 * BYTree$root.time)) +
  coord_geo(xlim = c(-490,500), ylim = c(.95,Ntip(BYTree)), neg = TRUE, expand = 5) +
  geom_tiplab(size = 2, align=TRUE, hjust = 1.10) +
  scale_x_continuous(breaks=seq(-485,-25,50), labels=abs(seq(-485,-25,50))) + 
  labs(caption="Divergence time using R8s") + theme_tree2(plot.margin=margin(5, 5, 5, 5))
q
ggsave("BY_TimeTree.pdf",q, width=7.5, height=4)