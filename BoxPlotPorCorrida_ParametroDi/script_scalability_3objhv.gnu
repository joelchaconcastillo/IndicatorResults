MOEAD= "#99ffff"; CPDEA= "#4671d5"
#set terminal pngcairo
#set terminal postscript portrait enhanced mono dashed lw 1 "Helvetica" 14 
set terminal postscript enhanced 'Times' color 
set terminal postscript enhanced font "Helvetica" 22
set output "initial_distance_factor_3obj_hv.eps" 
set key font ",18"
set yrange [0.84:0.96]
set ylabel "Normalized HV"
set xlabel "Initial Threshold Value"
set title "Problems with three objectives"
set autoscale xfix

set xtics 0,0.2,1.0
set style fill solid 0.25 border -1
set style boxplot nooutliers pointtype 7
set style data boxplot
set boxwidth 0.03

stats "BOXPLOT/vsd-hv_3_0.2" using 2 nooutput
#
plot for [i=0:STATS_blocks-2] "BOXPLOT/vsd-hv_3_0.2" using (-0.02+0.2*i):2 index i lt 1 lc rgb 'green' title "",\
for [i=STATS_blocks-1:STATS_blocks-1] "BOXPLOT/vsd-hv_3_0.2" using (-0.02+0.2*i):2 index i lt 1 lc rgb 'green' title "Px=0.2",\
for [i=0:STATS_blocks-2] "BOXPLOT/vsd-hv_3_1.0" using (0.02+0.2*i):2 index i lt 1 lc rgb 'blue' title "",\
for [i=STATS_blocks-1:STATS_blocks-1] "BOXPLOT/vsd-hv_3_1.0" using (0.02+0.2*i):2 index i lt 1 lc rgb 'blue' title "Px=1.0"

