###HV de los problemas WFG
##dos objetivos....

for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
do
	   echo "$i 2obj" >> HVS.txt
	   ./hv -r "2.1 4.1" "$i"_2.txt >> HVS.txt
done;
##tres objetivos....
for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
	do
	   echo "$i 3obj" >> HVS.txt
	   ./hv -r "2.1 4.1 6.1" "$i"_3.txt >> HVS.txt
done
####DTLZ
##dos objetivos..

for i in DTLZ1 DTLZ2 DTLZ4
      do
	      echo "$i 2obj" >> HVS.txt
         ./hv -r "1.1 1.1" "$i"_2.txt >> HVS.txt
      done
for i in DTLZ3 DTLZ5 DTLZ6
	do
	   echo "$i 2obj" >> HVS.txt
	   ./hv -r "3 3" "$i"_2.txt >> HVS.txt
	done;
echo "DTLZ7 2obj" >> HVS.txt
	./hv -r "1.1 4" DTLZ7_2.txt >> HVS.txt
##tres objetivos....

for i in DTLZ1 DTLZ2 DTLZ4
do
	   echo "$i 3obj" >> HVS.txt
      ./hv -r "1.1 1.1 1.1" "$i"_3.txt >> HVS.txt
done
for i in DTLZ3 DTLZ5 DTLZ6
do
	   echo "$i 3obj" >> HVS.txt
	   ./hv -r "3 3 3" "$i"_3.txt >> HVS.txt
done;

echo "DTLZ7 3obj" >> HVS.txt
	./hv -r "1.1 1.1 6" DTLZ7_3.txt >> HVS.txt
####UF 2obj
for i in UF1 UF2 UF3 UF4 UF5 UF6 UF7
      do
	      echo "$i 2obj" >> HVS.txt
         ./hv -r "2.0 2.0" "$i"_2.txt >> HVS.txt
      done
###UF 3obj
for i in UF8 UF9 UF10
do
	   echo "$i 3obj" >> HVS.txt
      ./hv -r "2.0 2.0 2.0" "$i"_3.txt >> HVS.txt
done


