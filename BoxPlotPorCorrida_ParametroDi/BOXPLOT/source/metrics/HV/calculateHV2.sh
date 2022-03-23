algname=(VSDMOEA)

##Calculating the HV considering plus 10% for each objective
for var in 50 100 250 500;
do
   	cont=0
	for alg in VSDMOEA;
	do
	   for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
	   do
		   rm ${algname[$cont]}/${i}_2_${var}
	
		   for file in ../$alg/${i}_2*_${var}
		   do
	 	      v1=$(./hv -r "2.2 4.4" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "2.2 4.4" ../Optimals/${i}_2_${var}.txt )
	             echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2_${var}
	            echo "" >>${algname[${cont}]}/${i}_2_${var}
		   done
	   done
	    for i in DTLZ2 DTLZ3 DTLZ4;
	    do
		    rm ${algname[$cont]}/${i}_2_${var}
	
		   for file in ../$alg/${i}_2*_${var}
		   do
		      v1=$(./hv -r "1.1 1.1" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "1.1 1.1" ../Optimals/${i}_2.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2_${var}
	              echo "" >>${algname[${cont}]}/${i}_2_${var}
		   done
	   done
	   i=DTLZ1
	   rm ${algname[$cont]}/${i}_2_${var}
	   for file in ../$alg/${i}_2*_${var}
	   do
	#      ./hv -r "0.55 0.55" $file >>${algname[${cont}]}/${i}_2
		      v1=$(./hv -r "0.55 0.55" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "0.55 0.55" ../Optimals/${i}_2.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2_${var}
	              echo "" >>${algname[${cont}]}/${i}_2_${var}
	
	   done
	
	
	  for i in DTLZ5 DTLZ6;
		do
			rm ${algname[$cont]}/${i}_2_${var}
		  # value=$(awk 'BEGIN{print sqrt(0.5)+0.1*sqrt(0.5)}')
		   for file in ../$alg/${i}_2*_${var}
		   do
		   #./hv -r "${value} ${value}" $file >>${algname[${cont}]}/${i}_2
		      v1=$(./hv -r "1.1 1.1" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "1.1 1.1" ../Optimals/${i}_2.txt)
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2_${var}
	              echo "" >>${algname[${cont}]}/${i}_2_${var}
		   #./hv -r "1.1 1.1" $file >>${algname[${cont}]}/${i}_2
		   done
	   done
	   i=DTLZ7
	   rm ${algname[$cont]}/${i}_2_${var}
	   for file in ../$alg/${i}_2*_${var}
	   do
	#      ./hv -r "1.1 4.4" $file >>${algname[${cont}]}/${i}_2
		      v1=$(./hv -r "1.1 4.4" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "1.1 4.4" ../Optimals/${i}_2.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2_${var}
	              echo "" >>${algname[${cont}]}/${i}_2_${var}
	   done
	
	   for i in UF1 UF2 UF3 UF4 UF5 UF6 UF7;
	   do
		   rm ${algname[$cont]}/${i}_2_${var}
	
		   for file in ../$alg/${i}_2*_${var}
		   do
	#	      ./hv -r "1.1 1.1" $file >>${algname[${cont}]}/${i}_2
		      v1=$(./hv -r "1.1 1.1" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "1.1 1.1" ../Optimals/${i}_2.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2_${var}
	              echo "" >>${algname[${cont}]}/${i}_2_${var}
	
		   done
	   done
	#################3obj
	   for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
	   do
		   rm ${algname[$cont]}/${i}_3_${var}
	
		   for file in ../$alg/${i}_3*_${var}
		   do
		      v1=$(./hv -r "2.2 4.4 6.6" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "2.2 4.4 6.6" ../Optimals/${i}_3_${var}.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3_${var}
	              echo "" >>${algname[${cont}]}/${i}_3_${var}
	
	#	      ./hv -r "2.2 4.4 6.6" $file >>${algname[${cont}]}/${i}_3
		   done
	   done
	
	    for i in DTLZ2 DTLZ3 DTLZ4;
	    do
		    rm ${algname[$cont]}/${i}_3_${var}
	
		   for file in ../$alg/${i}_3*_${var}
		   do
		      v1=$(./hv -r "1.1 1.1 1.1" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "1.1 1.1 1.1" ../Optimals/${i}_3.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3_${var}
	              echo "" >>${algname[${cont}]}/${i}_3_${var}
	#	      ./hv -r "1.1 1.1 1.1" $file >>${algname[${cont}]}/${i}_3
		   done
	   done
	   i=DTLZ1
	   rm ${algname[$cont]}/${i}_3_${var}
	   for file in ../$alg/${i}_3*_${var}
	   do
		      v1=$(./hv -r "0.55 0.55 0.55" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "0.55 0.55 0.55" ../Optimals/${i}_3.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3_${var}
	              echo "" >>${algname[${cont}]}/${i}_3_${var}
	#      ./hv -r "0.55 0.55 0.55" $file >>${algname[${cont}]}/${i}_3
	   done
	        value=$(awk 'BEGIN{print sqrt(0.5)+0.1*sqrt(0.5)}')
	        reference="$value $value 1.1"
	  for i in DTLZ5 DTLZ6;
		do
			rm ${algname[$cont]}/${i}_3_${var}
		  # value=$(awk 'BEGIN{print sqrt(0.5)+0.1*sqrt(0.5)}')
		   for file in ../$alg/${i}_3*_${var}
		   do
		   #./hv -r "${value} ${value}" $file >>${algname[${cont}]}/${i}_2
		      v1=$(./hv -r "$reference" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "$reference" ../Optimals/${i}_3.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3_${var}
	              echo "" >>${algname[${cont}]}/${i}_3_${var}
		   #./hv -r "1.1 1.1 1.1" $file >>${algname[${cont}]}/${i}_3
		   done
	   done
	   i=DTLZ7
	   rm ${algname[$cont]}/${i}_3_${var}
	   for file in ../$alg/${i}_3*_${var}
	   do
		      v1=$(./hv -r "1.1 1.1 6.6" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "1.1 1.1 6.6" ../Optimals/${i}_3.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3_${var}
	              echo "" >>${algname[${cont}]}/${i}_3_${var}
	      #./hv -r "1.1 1.1 6.6" $file >>${algname[${cont}]}/${i}_3
	   done
	
	   for i in UF8 UF9 UF10;
	   do
		   rm ${algname[$cont]}/${i}_3_${var}
	
		   for file in ../$alg/${i}_3*_${var}
		   do
		      v1=$(./hv -r "1.1 1.1 1.1" $file)
		      v1="${v1:-0}"
		      v2=$(./hv -r "1.1 1.1 1.1" ../Optimals/${i}_3.txt )
	              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3_${var}
	              echo "" >>${algname[${cont}]}/${i}_3_${var}
		      #./hv -r "1.1 1.1 1.1" $file >>${algname[${cont}]}/${i}_3
		   done
	   done
	   cont=$((cont+1))
	done
done
