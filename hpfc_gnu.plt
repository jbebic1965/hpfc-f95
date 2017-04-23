set terminal postscript landscape enhanced color solid
set output 'hpfc_calc.ps'
set xrange[-0.5:1.5]
set yrange[-1:1]
set size square
set parametric
 set title 'P =  0.1  p.u., nBm =  4 '
 set label 'Vec' at graph 1.05, 1.00
 set label 'Abs' at graph 1.15, 1.00
 set label 'Ang' at graph 1.30, 1.00
 set label 'Vs'  at graph 1.05, 0.95
set label '1.0000' at graph 1.15, .95
set label '  25.0000' at graph 1.30, .95
 set label 'Vr'  at graph 1.05, 0.90
set label '1.0000' at graph 1.15, .90
set label ' -25.0000' at graph 1.30, .90
 set label 'Vm'  at graph 1.05, 0.85
set label '0.8048' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '1.0315' at graph 1.15, .80
set label '  22.2215' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '1.0315' at graph 1.15, .75
set label ' -22.2215' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.4179' at graph 1.15, .70
set label '  68.9666' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.4179' at graph 1.15, .65
set label ' -68.9666' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.0826' at graph 1.15, .60
set label '  56.1660' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.0826' at graph 1.15, .55
set label ' -56.1660' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1373' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Value' at graph 1.05, 0.40
 set label 'Real' at graph 1.15, 0.40
 set label 'Imag' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 0.1000' at graph 1.15, .35
set label '-0.0605' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 0.1000' at graph 1.15, .30
set label '-0.0673' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 0.1000' at graph 1.15, .25
set label ' 0.0673' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 0.1000' at graph 1.15, .20
set label ' 0.0605' at graph 1.30, .20
 set label 'Qm' at graph 1.05, 0.15
set label '-0.0000' at graph 1.15, .15
set label '-0.1563' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label '-0.0476' at graph 1.15, .10
set label '-0.0108' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label ' 0.0476' at graph 1.15, .05
set label '-0.0108' at graph 1.30, .05
 plot [t=-pi:pi] xc= 0.96447253 , yc= 0. , r= 0.15962666 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.90630776 0.4226183
 0.8048458 0. 0.1500001 0.39008313
 e
 0. 0. 0.046011694 0.06864331
 e
 0. 0. 0.90630776 -0.4226183
 0.8048458 0. 0.1500001 -0.3900831
 e
 0. 0. 0.0460117 -0.06864332
 e
 0. 0. 0.8048458 0.
 e
 unset label 
