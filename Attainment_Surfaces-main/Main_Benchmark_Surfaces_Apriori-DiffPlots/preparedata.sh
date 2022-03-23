rm data/*
for instance in WFG1 WFG2 WFG3 WFG4 WFG5 WFG6 WFG7 WFG8 WFG9 UF1 UF2 UF3 UF4 UF5 UF6 UF7 DTLZ1 DTLZ2 DTLZ3 DTLZ4 DTLZ5 DTLZ6 DTLZ7;
do
   for s in {1..35}
   do 
      px=0.6
      tail -100 Raw_Data/VSD_R2/${instance}_2_${s}_${px}_0.4_0.5 >> data/VSD_R2_${instance}
      echo "">>data/VSD_R2_${instance}
#      px=0.6
#      tail -100 ../../Raw_Data/VSD_R2/${instance}_2_${s}_${px}_0.4_0.5 >> data/R2_EMOA_${instance}
#      echo "">>data/R2_EMOA_${instance}

      px=0.4
      tail -100 Raw_Data/R2_EMOA/${instance}_2_${s}_pc_${px} >> data/R2_EMOA_${instance}
      echo "">>data/R2_EMOA_${instance}
      px=0.6
      tail -100 Raw_Data/VSD_HV/${instance}_2_${s}_${px}_0.4_0.5 >> data/VSD_HV_${instance}
      echo "">>data/VSD_HV_${instance}
      px=0.6
#      tail -100 ../../Raw_Data/VSD_HV/${instance}_2_${s}_${px}_0.4_0.5 >> data/SMS_EMOA_${instance}
#      echo "">>data/SMS_EMOA_${instance}

      px=0.8
      tail -100 Raw_Data/SMS_EMOA/${instance}_2_${s}_${px} >> data/SMS_EMOA_${instance}
      echo "">>data/SMS_EMOA_${instance}
   done
done
