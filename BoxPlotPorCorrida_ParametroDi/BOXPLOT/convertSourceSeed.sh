m=vsd-r2
for px in 0.2 1.0;
do
  for m in vsd-r2 vsd-hv;
  do
    rm byseeds/${m}/*_2_${px}_*
    for i in DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7 WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 IMB1 IMB2 IMB3 IMB7 IMB8 IMB9;
    do
      for di in 0.0 0.2 0.4 0.6 0.8 1.0;
      do
         for s in {1..35};
         do
            head -n $s source/${m}/${i}_2_${px}_${di}_0.5 | tail -1 >> byseeds/${m}/${s}_2_${px}_${di}
         done
      done
    done
      rm byseeds/${m}/*_3_${px}_*
    for i in DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10 WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 IMB4 IMB5 IMB6 IMB10;
    do
      for di in 0.0 0.2 0.4 0.6 0.8 1.0;
      do
         for s in {1..35};
         do
            head -n $s source/${m}/${i}_3_${px}_${di}_0.5 | tail -1 >> byseeds/${m}/${s}_3_${px}_${di}
         done
      done
    done
    alg=$m
    for obj in 2 3;
    do
        rm ${alg}_${obj}_${px};
        for di in 0.0 0.2 0.4 0.6 0.8;
        do
         for s in {1..35}
         do
      	   echo -n \"${di}\"' ' >> ${alg}_${obj}_${px}
    	   cat byseeds/${alg}/${s}_${obj}_${px}_${di} | awk -F'\t' '{ sum += $1 } END { print sum / NR }' >> ${alg}_${obj}_${px}
         done
         echo  >> ${alg}_${obj}_${px}
         echo  >> ${alg}_${obj}_${px}
       done
        di=1.0
        for s in {1..35}
         do
      	   echo -n \"${di}\"' ' >> ${alg}_${obj}_${px}
    	   cat byseeds/${alg}/${s}_${obj}_${px}_${di} | awk -F'\t' '{ sum += $1 } END { print sum / NR }' >> ${alg}_${obj}_${px}
         done
    done
  done
done
