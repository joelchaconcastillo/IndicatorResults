import sys
from scipy import stats
from numpy import *
import re
def check_means(file1, file2):
   mean1 = mean(file1)
   mean2 = mean(file2)
   if mean1 > mean2:
      return 1
   elif mean1 < mean2:
     return -1
   elif mean1==mean2:
     return 0

def pair_test(file_a, file_b):
   file1 = loadtxt(file_a) #open("a.txt", "r") 
   file2 = loadtxt(file_b) #open("b.txt", "r") 
   
   
   ###Primero prueba de normalidad con shapiro wilk, es decir si pvalue menor 0.05 se rechaza la hipotesis de que los datos tienen una distribucion normal
   
   #The test rejects the hypothesis of normality when the p-value is less than or equal to 0.05
   if stats.shapiro(file1)[1] > 0.05 and stats.shapiro(file2)[1] > 0.05 :
   #levene...The Levene test tests the null hypothesis that all input samples are from populations with equal variances
     if stats.levene(file1, file2)[1] > 0.05 :
     #no equal variances.. 
   #The null hypothesis for an ANOVA is that there is no significant difference among the groups
   #The one-way ANOVA tests the null hypothesis that two or more groups have the same population mean. #if the p-value associated with the F is smaller than .05, then the null hypothesis is rejected and the alternative hypothesis is supported
#If the resulting p-value of Levene's test is less than some significance level (typically 0.05), the obtained differences in sample variances are unlikely to have occurred based on random sampling from a population with equal variances
        #if stats.f_oneway(file1, file2)[1] < 0.05:
        if stats.ttest_ind(file1, file2, equal_var = True)[1] < 0.05:
          return check_means(file1, file2) #print('no equal')
        else:
          return 0;#print('equal')
     else:
   #The null hypothesis for the test is that the means are equal.
   #If we observe a large p-value, for example larger than 0.05 or 0.1, then we cannot reject the null hypothesis of identical average scores
   # If the p-value is smaller than the threshold, e.g. 1%, 5% or 10%, then we reject the null hypothesis of equal averages.
   
   #        if stats.welch(file1, file2)[1] < 0.05:
           if stats.ttest_ind(file1, file2, equal_var = False)[1] < 0.05:
              return check_means(file1, file2) #print('no tie, so compare')
           else:
	      return 0 #print('tie')
   else:
   ## The Kruskal-Wallis H-test tests the null hypothesis that the population median of all of the groups are equal. It is a non-parametric version of ANOVA
   ##If p-value is less than 0.05 then we reject the null hypothesis
      if stats.kruskal(file1, file2)[1] > 0.05:
        return 0#print('tie')
      else:
        return check_means(file1, file2) #print('no tie, so check the means...')
#   print stats.shapiro(file1)[1]
#   print stats.shapiro(file2)[1]
#   print stats.kruskal(file1, file2)
   return


def process_instance(list_files):
  #for i, val1 in enumerate(list_files):
  Wins=[0]*len(list_files)
  Losts=[0]*len(list_files)
  Ties=[0]*len(list_files)
  for i, val1 in enumerate(list_files):
    for j in range(0, i):#, val2 in enumerate(list_files):
       val2=list_files[j]
  #     if j == i:
  #        continue
      #if i wins +1, j wins -1, tie 0
       if pair_test(val1,val2) == 1: 
          Wins[i]+=1
  	  Losts[j]+=1
       elif pair_test(val1,val2) == -1: 
          Wins[j]+=1
  	  Losts[i]+=1
       else:
  	  Ties[i]+=1
  	  Ties[j]+=1
#  print "file Wins Loses Ties"
  bestv=-100000
  #bestv=100000
  for i, val1 in enumerate(list_files):
     bestv = max(bestv, mean(loadtxt(val1)))
     #bestv = min(bestv, mean(loadtxt(val1)))


  for i, val1 in enumerate(list_files):
     sys.stdout.write(" "+str(Wins[i])+" "+str(Losts[i])+" "+str(Ties[i])+" "+str(abs(bestv-mean(loadtxt(val1)))))
     sys.stdout.flush()
  print ""
#     print val1+" "+str(Wins[i])+" "+str(Losts[i])+" "+str(Ties[i])

##Load the entire file
list_files = open(sys.argv[1], "r")
#list_files = open("file", "r")
#print list_files.read()
#split the text by instance...
for inst in list_files.read().replace(" ", "").split('--'):
   instance_list=[]
   flag = 0
   for line in inst.split('\n'):
        if re.match(r'^\s*$', line):
           continue
	if flag == 0:
           sys.stdout.write(line)
           sys.stdout.flush()
	   #print "instance  "+line
	   flag = 1
	else:
	   instance_list.append(line)	
   process_instance(instance_list)
	
#print list_files
#with open("files") as f:
#   lines = f.readlines()
#   print lines
     

#list_files=[]
#list_files.append("a.txt")
#list_files.append("b.txt")


