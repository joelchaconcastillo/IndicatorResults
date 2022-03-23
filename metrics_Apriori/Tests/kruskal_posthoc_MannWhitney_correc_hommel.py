import sys
import scikit_posthocs as sp
import re
import statsmodels.api as sa
import scipy.stats as ss
import statsmodels.formula.api as sfa
import pandas as pd
from scipy import stats
from numpy import *
alpha=0.05
def check_means(file1, file2):
   mean1 = mean(file1)
   mean2 = mean(file2)
   if mean1 > mean2:
      return 1
   elif mean1 < mean2:
     return -1
   else:
     return 0

def process_instance(list_files):
  ##Load all the algoritms in a different class..
  Wins=[0]*len(list_files)
  Losts=[0]*len(list_files)
  Ties=[0]*len(list_files)
  Diff=[0]*len(list_files)
  data = list()
  for i, val1 in enumerate(list_files):
    data.append(loadtxt(val1))
  ##Run kruskal test, a p-value > 0.05 accepts the null hypothesis
  T, p = ss.kruskal(*data)
  ##null hypothesis is rejected, try a post-hoc analyzes with a correction procedure
  if p < alpha: 
    ptable = sp.posthoc_dunn(data, p_adjust = 'hommel')
    bestv=-100000
    #bestv=100000
    bestidx=-1;
    for i, val1 in enumerate(list_files):
      currentmean=mean(loadtxt(val1))
      #if bestv > currentmean:
      if bestv < currentmean:
         bestv=currentmean
         bestidx=i
    for i in range(0,len(list_files)):
        val1=list_files[i]
        for j in range(0, i):
            val2=list_files[j]
            if ptable.iat[i,j] > alpha:
                Ties[i]+=1
                Ties[j]+=1
            else:
                if check_means(loadtxt(val1),loadtxt(val2)) == 1: 
                  Wins[i]+=1
                  Losts[j]+=1
                  if i==bestidx:
                    Diff[j] = bestv-mean(loadtxt(val2))
                    #Diff[j] = mean(loadtxt(val2))-bestv
                elif check_means(loadtxt(val1),loadtxt(val2)) == -1: 
                  Wins[j]+=1
                  Losts[i]+=1
                  if j==bestidx:
                    Diff[i] = bestv-mean(loadtxt(val1))
                    #Diff[i] = mean(loadtxt(val1))-bestv
                else:
                  Ties[i] +=1
                  Ties[j] +=1
  else:
   Ties[0:len(list_files)] += ones(len(list_files))*(len(list_files)-1)
  for i, val1 in enumerate(list_files):
    #sys.stdout.write(" "+str(Wins[i])+" "+str(Losts[i])+" "+str(Ties[i])+" "+str(Diff[i])+" "+str(mean(loadtxt(val1)))+" "+str(median(loadtxt(val1))))
    sys.stdout.write(" "+str(Wins[i])+" "+str(Losts[i])+" "+str(Ties[i])+" "+str(Diff[i])+" "+str(min(loadtxt(val1))) + " "+ str(max(loadtxt(val1)))+" " +str(mean(loadtxt(val1)))+" "+str(median(loadtxt(val1))))
    sys.stdout.flush()
  print("")

def process_instance_info(list_files):
  ##Load all the algoritms in a different class..
  Wins=[0]*len(list_files)
  Losts=[0]*len(list_files)
  Ties=[0]*len(list_files)
  data = list()
  for i, val1 in enumerate(list_files):
    data.append(loadtxt(val1))
  ##Run kruskal test, a p-value > 0.05 accepts the null hypothesis
  T, p = ss.kruskal(*data)
  bestv=-100000
  for i, val1 in enumerate(list_files):
     bestv = max(bestv, median(loadtxt(val1)))
  for i, val1 in enumerate(list_files):
     sys.stdout.write(" "+str(abs(bestv-median(loadtxt(val1)))))
     sys.stdout.flush()
  print("")

def Kruskal_Posthoc_MannWhitney_score():
  list_files = open(sys.argv[1], "r")
  for inst in list_files.read().split('\n'):
    if len(inst) == 0:
       print(inst)
       continue
    problem = inst.split(' ')[0]
    algorithms = inst.split(' ')[1:]
    while("" in algorithms): algorithms.remove("") ##remove empty elements
    sys.stdout.write(problem)
    sys.stdout.flush()
    process_instance(algorithms)
def Kruskal_Posthoc_MannWhitney_info():
  print("Kruskal test with posthoc MannWhitney and holm correction")
  list_files = open(sys.argv[1], "r")
  for inst in list_files.read().split('\n'):
    if len(inst)==0:
        continue
    problem = inst.split(' ')[0]
    algorithms = inst.split(' ')[1:]
    while("" in algorithms): algorithms.remove("") ##remove empty elements
    sys.stdout.write(problem)
    sys.stdout.flush()
    process_instance_info(algorithms)
#####################################MAIN####################
##Load the entire file
Kruskal_Posthoc_MannWhitney_score()
#Kruskal_Posthoc_MannWhitney_info()

