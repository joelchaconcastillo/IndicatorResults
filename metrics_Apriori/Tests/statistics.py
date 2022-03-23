import sys
#from scipy import stats
from numpy import *
import re
def statistic(file_a, bestv):
   file1 = loadtxt(file_a) #open("a.txt", "r") 
   sys.stdout.write(str(min(file1))+" "+str(max(file1))+" "+ str(mean(file1))+" "+str(std(file1))+" "+str(abs(mean(file1)-bestv))+" ")
   #sys.stdout.write(str(min(file1))+" "+str(max(file1))+" "+ str(mean(file1))+" "+str(std(file1))+" "+str(abs(mean(file1)-bestv))+" ")
   sys.stdout.flush()
def process_instance(list_files):
  bestv = -1000000
  #bestv = 1000000
  for i, val1 in enumerate(list_files):
     bestv = max(bestv, mean(loadtxt(val1)))
   #  bestv = min(bestv, mean(loadtxt(val1)))
  for i, val1 in enumerate(list_files):
     statistic(val1, bestv)
  print("")
##Load the entire file
list_files = open(sys.argv[1], "r")
#list_files = open("file", "r")
#print list_files.read()
#split the text by instance...

sys.stdout.write("min max mean std") 

for inst in list_files.read().replace(" ", "").split('--'):
   instance_list=[]
   flag = 0
   for line in inst.split('\n'):
        if re.match(r'^\s*$', line):
           continue
        if flag == 0:
           sys.stdout.write(line+" ")
           sys.stdout.flush()
           flag = 1
        else:
           instance_list.append(line)	
   process_instance(instance_list)
	

