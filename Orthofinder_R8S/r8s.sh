#!/bin/bash
#SBATCH --nodes 1 --ntasks 8 --mem 64G --out R8s.%A.log --time 48:00:00 -p stajichlab

module load r8s
r8s -b -f r8s_Hakim2.nex > r8s_2.out
