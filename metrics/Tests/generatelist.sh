PATHA=../HV
for Px in 0.2 0.4 0.6 0.8 1.0
do
  for DI in 0.4;
  do
     postfix=${Px}_${DI}_0.5
      for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF1 UF2 UF3 UF4 UF5 UF6 UF7 IMB1 IMB2 IMB3 IMB7 IMB8 IMB9;
     do
         echo -n "--"${i}_2" "; 
           echo -n ${PATHA}/POF_vsd_hv_xover/${i}_2_${postfix}" "
           echo -n ${PATHA}/POF_sms_emoa_xover/${i}_2_${Px}" "
          # echo -n ${PATHA}/POF_vsd_r2_xover/${i}_2_${postfix}" "
          # echo -n ${PATHA}/POF_r2_emoa_xover/${i}_2_pc_${Px}" "
          # echo -n ${PATHA}/POF_vsd_r2_xover/${i}_2_${postfix}" "
          # echo -n ${PATHA}/POF_r2_emoa_xover/${i}_2_pc_${Px}" "

         echo
     done
  done
done
 for Px in 0.2 0.4 0.6 0.8 1.0
do
  for DI in 0.4;
  do
     postfix=${Px}_${DI}_0.5
    
     for i in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7 UF8 UF9 UF10 IMB4 IMB5 IMB6 IMB10;
     do
           echo -n "--"${i}_3" "; 
           echo -n ${PATHA}/POF_vsd_hv_xover/${i}_3_${postfix}" "
           echo -n ${PATHA}/POF_sms_emoa_xover/${i}_3_${Px}" "
#           echo -n ${PATHA}/POF_vsd_r2_xover/${i}_3_${postfix}" "
#           echo -n ${PATHA}/POF_r2_emoa_xover/${i}_3_pc_${Px}" "
         echo
     done
  done
done
