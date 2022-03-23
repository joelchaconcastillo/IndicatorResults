PATH1=../POF
#for T in LINEAL GEOMETRIC1 GEOMETRIC2 LOGARITHMIC EXPONENTIAL
DF=0.5
pc=0.4
for Di in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0;
do
for T in LINEAL
do
for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7
do
   for sed in {1..35}   
   do
   tail -100 $PATH1/POF_VSD-MOEA_${instance}_RUN_${sed}_*_nvar_*_nobj_2_Di_${Di}00*_nfes_250*_Df_${DF}*pc_${pc}*_$T > ${T}/${instance}_2_${sed}_${Di}
   done
done
for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10
do
   for sed in {1..35}   
   do
   tail -100 $PATH1/POF_VSD-MOEA_${instance}_RUN_${sed}_*_nvar_*_nobj_3_Di_${Di}00*_nfes_250*_Df_${DF}*pc_${pc}*_$T > ${T}/${instance}_3_${sed}_${Di}
   done
done
done
done

