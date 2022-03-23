#algname=(GDE3 MOEA-D NSGAII R2-MOEA IBEA VSD-MOEA-eta-2 VSD-MOEA-eta-5 SMS-EMOA)
#algname=(MOEA-D NSGA-II NSGA-III R2-EMOA VSD-MOEA-D)
algname=(POF)
##Calculating the HV considering plus 10% for each objective
   cont=0
#for alg in GDE3/POF MOEA-D/SBX/POF NSGAII/SBX/POF R2MOEA/SBX/POF IBEA/SBX/POF VSD-MOEA-eta-2/SBX/POF VSD-MOEA-eta-5/SBX/POF SMS-EMOA/SBX/POF
#for alg in MOEA-D/SBX/POF NSGAII/SBX/POF R2MOEA/SBX/POF VSD-MOEA-eta-2-clean/SBX/POF
for alg in ${algname[@]}
do
#   alg=($alg"/POF/")
   for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
   do
	   rm ${algname[$cont]}/${i}_2

	   for file in ../$alg/${i}_2*
	   do
#	       >>${algname[${cont}]}/${i}_2
 	      v1=$(./hv -r "2.2 4.4" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "2.2 4.4" ../Optimals/${i}_2.txt )
             echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
            echo "" >>${algname[${cont}]}/${i}_2
	   done
   done
    for i in DTLZ2 DTLZ3 DTLZ4;
    do
	    rm ${algname[$cont]}/${i}_2

	   for file in ../$alg/${i}_2*
	   do
	      v1=$(./hv -r "1.1 1.1" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2
	   done
   done
   i=DTLZ1
   rm ${algname[$cont]}/${i}_2
   for file in ../$alg/${i}_2*
   do
#      ./hv -r "0.55 0.55" $file >>${algname[${cont}]}/${i}_2
	      v1=$(./hv -r "0.55 0.55" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "0.55 0.55" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2

   done


  for i in DTLZ5 DTLZ6;
	do
		rm ${algname[$cont]}/${i}_2
	  # value=$(awk 'BEGIN{print sqrt(0.5)+0.1*sqrt(0.5)}')
	   for file in ../$alg/${i}_2*
	   do
	   #./hv -r "${value} ${value}" $file >>${algname[${cont}]}/${i}_2
	      v1=$(./hv -r "1.1 1.1" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2
	   #./hv -r "1.1 1.1" $file >>${algname[${cont}]}/${i}_2
	   done
   done
   i=DTLZ7
   rm ${algname[$cont]}/${i}_2
   for file in ../$alg/${i}_2*
   do
#      ./hv -r "1.1 4.4" $file >>${algname[${cont}]}/${i}_2
	      v1=$(./hv -r "1.1 4.4" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 4.4" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2
   done

   for i in UF1 UF2 UF3 UF4 UF5 UF6 UF7;
   do
	   rm ${algname[$cont]}/${i}_2

	   for file in ../$alg/${i}_2*
	   do
#	      ./hv -r "1.1 1.1" $file >>${algname[${cont}]}/${i}_2
	      v1=$(./hv -r "1.1 1.1" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1" ../Optimals/${i}_2.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_2
              echo "" >>${algname[${cont}]}/${i}_2

	   done
   done
#################3obj
   for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9;
   do
	   rm ${algname[$cont]}/${i}_3

	   for file in ../$alg/${i}_3*
	   do
	      v1=$(./hv -r "2.2 4.4 6.6" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "2.2 4.4 6.6" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3

#	      ./hv -r "2.2 4.4 6.6" $file >>${algname[${cont}]}/${i}_3
	   done
   done

    for i in DTLZ2 DTLZ3 DTLZ4;
    do
	    rm ${algname[$cont]}/${i}_3

	   for file in ../$alg/${i}_3*
	   do
	      v1=$(./hv -r "1.1 1.1 1.1" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1 1.1" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
#	      ./hv -r "1.1 1.1 1.1" $file >>${algname[${cont}]}/${i}_3
	   done
   done
   i=DTLZ1
   rm ${algname[$cont]}/${i}_3
   for file in ../$alg/${i}_3*
   do
	      v1=$(./hv -r "0.55 0.55 0.55" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "0.55 0.55 0.55" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
#      ./hv -r "0.55 0.55 0.55" $file >>${algname[${cont}]}/${i}_3
   done
        value=$(awk 'BEGIN{print sqrt(0.5)+0.1*sqrt(0.5)}')
        reference="$value $value 1.1"
  for i in DTLZ5 DTLZ6;
	do
		rm ${algname[$cont]}/${i}_3
	  # value=$(awk 'BEGIN{print sqrt(0.5)+0.1*sqrt(0.5)}')
	   for file in ../$alg/${i}_3*
	   do
	   #./hv -r "${value} ${value}" $file >>${algname[${cont}]}/${i}_2
	      v1=$(./hv -r "$reference" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "$reference" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
	   #./hv -r "1.1 1.1 1.1" $file >>${algname[${cont}]}/${i}_3
	   done
   done
   i=DTLZ7
   rm ${algname[$cont]}/${i}_3
   for file in ../$alg/${i}_3*
   do
	      v1=$(./hv -r "1.1 1.1 6.6" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1 6.6" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
      #./hv -r "1.1 1.1 6.6" $file >>${algname[${cont}]}/${i}_3
   done

   for i in UF8 UF9 UF10;
   do
	   rm ${algname[$cont]}/${i}_3

	   for file in ../$alg/${i}_3*
	   do
	      v1=$(./hv -r "1.1 1.1 1.1" $file)
	      v1="${v1:-0}"
	      v2=$(./hv -r "1.1 1.1 1.1" ../Optimals/${i}_3.txt )
              echo print ${v1}/${v2} | perl  >> ${algname[${cont}]}/${i}_3
              echo "" >>${algname[${cont}]}/${i}_3
	      #./hv -r "1.1 1.1 1.1" $file >>${algname[${cont}]}/${i}_3
	   done
   done
   cont=$((cont+1))
done
