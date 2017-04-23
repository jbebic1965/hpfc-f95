# set terminal postscript landscape enhanced color solid
# set output 'hpfc_calc.ps'
set terminal png notransparent small size 640, 480 nocrop enhanced
set output 'hpfc_calc.png'
# set terminal gif medium size 640, 480 
# set output 'hpfc_calc.gif'
set xrange[-0.5:1.5]
set yrange[-1:1]
set size square
set parametric
 set title 'P =  0.6  p.u., nBm =  4 '
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
set label '1.0709' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '0.9785' at graph 1.15, .80
set label '   7.1459' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '0.9785' at graph 1.15, .75
set label '  -7.1459' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.1575' at graph 1.15, .70
set label ' 129.4050' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.1575' at graph 1.15, .65
set label '-129.4050' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.4352' at graph 1.15, .60
set label '  12.1138' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.4352' at graph 1.15, .55
set label ' -12.1138' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1827' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 0.6000' at graph 1.15, .35
set label ' 0.1373' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 0.6000' at graph 1.15, .30
set label '-0.0522' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 0.6000' at graph 1.15, .25
set label ' 0.0522' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 0.6000' at graph 1.15, .20
set label '-0.1373' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.2766' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label ' 0.0445' at graph 1.15, .10
set label '-0.0862' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label '-0.0445' at graph 1.15, .05
set label '-0.0862' at graph 1.30, .05
 plot [t=-pi:pi] xc= 0.96447253 , yc= 0. , r= 0.106417775 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.90630776 0.4226183
 1.0708902 0. -0.099999845 0.121720254
 e
 0. 0. 0.4255341 0.091333576
 e
 0. 0. 0.90630776 -0.4226183
 1.0708902 0. -0.099999845 -0.121720254
 e
 0. 0. 0.4255341 -0.09133358
 e
 0. 0. 1.0708902 0.
 e
 unset label 
 set title 'P =  0.7  p.u., nBm =  4 '
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
set label '1.0709' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '0.9732' at graph 1.15, .80
set label '   3.9213' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '0.9732' at graph 1.15, .75
set label '  -3.9213' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.1201' at graph 1.15, .70
set label ' 146.3556' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.1201' at graph 1.15, .65
set label '-146.3556' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.5118' at graph 1.15, .60
set label '  10.2804' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.5118' at graph 1.15, .55
set label ' -10.2804' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1827' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 0.7000' at graph 1.15, .35
set label ' 0.1839' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 0.7000' at graph 1.15, .30
set label '-0.0780' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 0.7000' at graph 1.15, .25
set label ' 0.0780' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 0.7000' at graph 1.15, .20
set label '-0.1839' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.2766' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label ' 0.0626' at graph 1.15, .10
set label '-0.0603' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label '-0.0626' at graph 1.15, .05
set label '-0.0603' at graph 1.30, .05
 plot [t=-pi:pi] xc= 0.96447253 , yc= 0. , r= 0.106417775 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.90630776 0.4226183
 1.0708902 0. -0.099999845 0.06655142
 e
 0. 0. 0.50355464 0.091333576
 e
 0. 0. 0.90630776 -0.4226183
 1.0708902 0. -0.099999845 -0.06655142
 e
 0. 0. 0.50355464 -0.09133358
 e
 0. 0. 1.0708902 0.
 e
 unset label 
 set title 'P =  0.8  p.u., nBm =  4 '
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
set label '1.0709' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '0.9710' at graph 1.15, .80
set label '   0.6717' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '0.9710' at graph 1.15, .75
set label '  -0.6717' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.1006' at graph 1.15, .70
set label ' 173.5063' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.1006' at graph 1.15, .65
set label '-173.5063' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.5887' at graph 1.15, .60
set label '   8.9251' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.5887' at graph 1.15, .55
set label '  -8.9251' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1827' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 0.8000' at graph 1.15, .35
set label ' 0.2305' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 0.8000' at graph 1.15, .30
set label '-0.1160' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 0.8000' at graph 1.15, .25
set label ' 0.1160' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 0.8000' at graph 1.15, .20
set label '-0.2305' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.2766' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label ' 0.0808' at graph 1.15, .10
set label '-0.0223' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label '-0.0808' at graph 1.15, .05
set label '-0.0223' at graph 1.30, .05
 plot [t=-pi:pi] xc= 0.96447253 , yc= 0. , r= 0.106417775 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.90630776 0.4226183
 1.0708902 0. -0.099999845 0.01138249
 e
 0. 0. 0.5815753 0.091333576
 e
 0. 0. 0.90630776 -0.4226183
 1.0708902 0. -0.099999845 -0.01138249
 e
 0. 0. 0.5815753 -0.09133358
 e
 0. 0. 1.0708902 0.
 e
 unset label 
 set title 'P =  0.9  p.u., nBm =  4 '
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
set label '1.0709' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '0.9719' at graph 1.15, .80
set label '  -2.5822' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '0.9719' at graph 1.15, .75
set label '   2.5822' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.1092' at graph 1.15, .70
set label '-156.3531' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.1092' at graph 1.15, .65
set label ' 156.3531' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.6659' at graph 1.15, .60
set label '   7.8836' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.6659' at graph 1.15, .55
set label '  -7.8836' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1827' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 0.9000' at graph 1.15, .35
set label ' 0.2772' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 0.9000' at graph 1.15, .30
set label '-0.1662' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 0.9000' at graph 1.15, .25
set label ' 0.1662' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 0.9000' at graph 1.15, .20
set label '-0.2772' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.2766' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label ' 0.0989' at graph 1.15, .10
set label ' 0.0279' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label '-0.0989' at graph 1.15, .05
set label ' 0.0279' at graph 1.30, .05
 plot [t=-pi:pi] xc= 0.96447253 , yc= 0. , r= 0.106417775 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.90630776 0.4226183
 1.0708902 0. -0.099999845 -0.043786377
 e
 0. 0. 0.65959585 0.091333576
 e
 0. 0. 0.90630776 -0.4226183
 1.0708902 0. -0.099999845 0.043786377
 e
 0. 0. 0.65959585 -0.09133358
 e
 0. 0. 1.0708902 0.
 e
 unset label 
 set title 'P =  1.  p.u., nBm =  4 '
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
set label '1.0709' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '0.9759' at graph 1.15, .80
set label '  -5.8196' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '0.9759' at graph 1.15, .75
set label '   5.8196' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.1407' at graph 1.15, .70
set label '-135.3008' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.1407' at graph 1.15, .65
set label ' 135.3008' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.7432' at graph 1.15, .60
set label '   7.0586' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.7432' at graph 1.15, .55
set label '  -7.0586' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1827' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 1.0000' at graph 1.15, .35
set label ' 0.3238' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 1.0000' at graph 1.15, .30
set label '-0.2286' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 1.0000' at graph 1.15, .25
set label ' 0.2286' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 1.0000' at graph 1.15, .20
set label '-0.3238' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.2766' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label ' 0.1171' at graph 1.15, .10
set label ' 0.0903' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label '-0.1171' at graph 1.15, .05
set label ' 0.0903' at graph 1.30, .05
 plot [t=-pi:pi] xc= 0.96447253 , yc= 0. , r= 0.106417775 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.90630776 0.4226183
 1.0708902 0. -0.099999845 -0.0989553
 e
 0. 0. 0.7376165 0.091333576
 e
 0. 0. 0.90630776 -0.4226183
 1.0708902 0. -0.099999845 0.0989553
 e
 0. 0. 0.7376165 -0.09133358
 e
 0. 0. 1.0708902 0.
 e
 unset label 
 set title 'P =  0.6  p.u., nBm =  4 '
 set label 'Vec' at graph 1.05, 1.00
 set label 'Abs' at graph 1.15, 1.00
 set label 'Ang' at graph 1.30, 1.00
 set label 'Vs'  at graph 1.05, 0.95
set label '1.0000' at graph 1.15, .95
set label '  20.0000' at graph 1.30, .95
 set label 'Vr'  at graph 1.05, 0.90
set label '1.0000' at graph 1.15, .90
set label ' -20.0000' at graph 1.30, .90
 set label 'Vm'  at graph 1.05, 0.85
set label '0.9837' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '1.0000' at graph 1.15, .80
set label '   2.5424' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '1.0000' at graph 1.15, .75
set label '  -2.5424' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.0469' at graph 1.15, .70
set label '  70.9269' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.0469' at graph 1.15, .65
set label ' -70.9269' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.4292' at graph 1.15, .60
set label '  11.2712' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.4292' at graph 1.15, .55
set label ' -11.2712' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1678' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 0.6000' at graph 1.15, .35
set label ' 0.0921' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 0.6000' at graph 1.15, .30
set label '-0.0921' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 0.6000' at graph 1.15, .25
set label ' 0.0921' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 0.6000' at graph 1.15, .20
set label '-0.0921' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label '-0.0000' at graph 1.15, .15
set label '-0.2334' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label '-0.0144' at graph 1.15, .10
set label '-0.0246' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label ' 0.0144' at graph 1.15, .05
set label '-0.0246' at graph 1.30, .05
 plot [t=-pi:pi] xc= 1. , yc= 0. , r= 0.106417775 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.9396926 0.34202015
 0.98367846 0. 0.015337229 0.0443587
 e
 0. 0. 0.42095688 0.083895504
 e
 0. 0. 0.9396926 -0.34202015
 0.98367846 0. 0.015337229 -0.04435867
 e
 0. 0. 0.4209569 -0.083895504
 e
 0. 0. 0.98367846 0.
 e
 unset label 
 set title 'P =  0.7  p.u., nBm =  4 '
 set label 'Vec' at graph 1.05, 1.00
 set label 'Abs' at graph 1.15, 1.00
 set label 'Ang' at graph 1.30, 1.00
 set label 'Vs'  at graph 1.05, 0.95
set label '1.0000' at graph 1.15, .95
set label '  20.0000' at graph 1.30, .95
 set label 'Vr'  at graph 1.05, 0.90
set label '1.0000' at graph 1.15, .90
set label ' -20.0000' at graph 1.30, .90
 set label 'Vm'  at graph 1.05, 0.85
set label '0.9994' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '1.0000' at graph 1.15, .80
set label '  -0.4873' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '1.0000' at graph 1.15, .75
set label '   0.4873' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.0085' at graph 1.15, .70
set label ' -86.2082' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.0085' at graph 1.15, .65
set label '  86.2082' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.5030' at graph 1.15, .60
set label '   9.7563' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.5030' at graph 1.15, .55
set label '  -9.7563' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1705' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 0.7000' at graph 1.15, .35
set label ' 0.1265' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 0.7000' at graph 1.15, .30
set label '-0.1265' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 0.7000' at graph 1.15, .25
set label ' 0.1265' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 0.7000' at graph 1.15, .20
set label '-0.1265' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.2409' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label ' 0.0006' at graph 1.15, .10
set label ' 0.0060' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label '-0.0006' at graph 1.15, .05
set label ' 0.0060' at graph 1.30, .05
 plot [t=-pi:pi] xc= 1. , yc= 0. , r= 0.106417775 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.9396926 0.34202015
 0.99940014 0. 0.0005636811 -0.008505076
 e
 0. 0. 0.49571753 0.085236356
 e
 0. 0. 0.9396926 -0.34202015
 0.99940014 0. 0.0005636811 0.008505076
 e
 0. 0. 0.49571753 -0.085236356
 e
 0. 0. 0.99940014 0.
 e
 unset label 
 set title 'P =  0.8  p.u., nBm =  4 '
 set label 'Vec' at graph 1.05, 1.00
 set label 'Abs' at graph 1.15, 1.00
 set label 'Ang' at graph 1.30, 1.00
 set label 'Vs'  at graph 1.05, 0.95
set label '1.0000' at graph 1.15, .95
set label '  20.0000' at graph 1.30, .95
 set label 'Vr'  at graph 1.05, 0.90
set label '1.0000' at graph 1.15, .90
set label ' -20.0000' at graph 1.30, .90
 set label 'Vm'  at graph 1.05, 0.85
set label '0.9677' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '1.0000' at graph 1.15, .80
set label '  -3.5782' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '1.0000' at graph 1.15, .75
set label '   3.5782' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.0694' at graph 1.15, .70
set label ' -64.0476' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.0694' at graph 1.15, .65
set label '  64.0476' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.5779' at graph 1.15, .60
set label '   8.2109' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.5779' at graph 1.15, .55
set label '  -8.2109' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1651' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 0.8000' at graph 1.15, .35
set label ' 0.1670' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 0.8000' at graph 1.15, .30
set label '-0.1670' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 0.8000' at graph 1.15, .25
set label ' 0.1670' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 0.8000' at graph 1.15, .20
set label '-0.1670' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.2259' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label '-0.0173' at graph 1.15, .10
set label ' 0.0540' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label ' 0.0173' at graph 1.15, .05
set label ' 0.0540' at graph 1.30, .05
 plot [t=-pi:pi] xc= 1. , yc= 0. , r= 0.106417775 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.9396926 0.34202015
 0.96767515 0. 0.030375421 -0.062410325
 e
 0. 0. 0.5719511 0.08253062
 e
 0. 0. 0.9396926 -0.34202015
 0.96767515 0. 0.030375421 0.062410325
 e
 0. 0. 0.5719511 -0.08253062
 e
 0. 0. 0.96767515 0.
 e
 unset label 
 set title 'P =  0.9  p.u., nBm =  4 '
 set label 'Vec' at graph 1.05, 1.00
 set label 'Abs' at graph 1.15, 1.00
 set label 'Ang' at graph 1.30, 1.00
 set label 'Vs'  at graph 1.05, 0.95
set label '1.0000' at graph 1.15, .95
set label '  20.0000' at graph 1.30, .95
 set label 'Vr'  at graph 1.05, 0.90
set label '1.0000' at graph 1.15, .90
set label ' -20.0000' at graph 1.30, .90
 set label 'Vm'  at graph 1.05, 0.85
set label '0.8936' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '1.0005' at graph 1.15, .80
set label '  -6.7299' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '1.0005' at graph 1.15, .75
set label '   6.7299' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.1541' at graph 1.15, .70
set label ' -49.5387' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.1541' at graph 1.15, .65
set label '  49.5387' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.6540' at graph 1.15, .60
set label '   6.6924' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.6540' at graph 1.15, .55
set label '  -6.6924' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1524' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 0.9000' at graph 1.15, .35
set label ' 0.2129' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 0.9000' at graph 1.15, .30
set label '-0.2148' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 0.9000' at graph 1.15, .25
set label ' 0.2148' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 0.9000' at graph 1.15, .20
set label '-0.2129' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.1926' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label '-0.0792' at graph 1.15, .10
set label ' 0.1185' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label ' 0.0792' at graph 1.15, .05
set label ' 0.1185' at graph 1.30, .05
 plot [t=-pi:pi] xc= 1. , yc= 0. , r= 0.106417775 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.9396926 0.34202015
 0.8935821 0. 0.10000014 -0.117245585
 e
 0. 0. 0.64949983 0.07621141
 e
 0. 0. 0.9396926 -0.34202015
 0.8935821 0. 0.10000014 0.117245585
 e
 0. 0. 0.64949983 -0.07621141
 e
 0. 0. 0.8935821 0.
 e
 unset label 
 set title 'P =  1.  p.u., nBm =  3 '
 set label 'Vec' at graph 1.05, 1.00
 set label 'Abs' at graph 1.15, 1.00
 set label 'Ang' at graph 1.30, 1.00
 set label 'Vs'  at graph 1.05, 0.95
set label '1.0000' at graph 1.15, .95
set label '  20.0000' at graph 1.30, .95
 set label 'Vr'  at graph 1.05, 0.90
set label '1.0000' at graph 1.15, .90
set label ' -20.0000' at graph 1.30, .90
 set label 'Vm'  at graph 1.05, 0.85
set label '0.9974' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '1.0000' at graph 1.15, .80
set label ' -10.0000' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '1.0000' at graph 1.15, .75
set label '  10.0000' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.1741' at graph 1.15, .70
set label ' -94.1638' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.1741' at graph 1.15, .65
set label '  94.1638' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.7321' at graph 1.15, .60
set label '   5.0000' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.7321' at graph 1.15, .55
set label '  -5.0000' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.1276' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 1.0000' at graph 1.15, .35
set label ' 0.2679' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 1.0000' at graph 1.15, .30
set label '-0.2679' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 1.0000' at graph 1.15, .25
set label ' 0.2679' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 1.0000' at graph 1.15, .20
set label '-0.2679' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.1800' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label ' 0.0287' at graph 1.15, .10
set label ' 0.1779' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label '-0.0287' at graph 1.15, .05
set label ' 0.1779' at graph 1.30, .05
 plot [t=-pi:pi] xc= 0.98420894 , yc= 0. , r= 0.104737334 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.9396926 0.34202015
 0.99744934 0. -0.012641549 -0.17364806
 e
 0. 0. 0.72926503 0.06380249
 e
 0. 0. 0.9396926 -0.34202015
 0.99744934 0. -0.012641549 0.17364806
 e
 0. 0. 0.72926503 -0.06380249
 e
 0. 0. 0.99744934 0.
 e
 unset label 
 set title 'P =  1.1  p.u., nBm =  2 '
 set label 'Vec' at graph 1.05, 1.00
 set label 'Abs' at graph 1.15, 1.00
 set label 'Ang' at graph 1.30, 1.00
 set label 'Vs'  at graph 1.05, 0.95
set label '1.0000' at graph 1.15, .95
set label '  20.0000' at graph 1.30, .95
 set label 'Vr'  at graph 1.05, 0.90
set label '1.0000' at graph 1.15, .90
set label ' -20.0000' at graph 1.30, .90
 set label 'Vm'  at graph 1.05, 0.85
set label '1.0720' at graph 1.15, .85
set label '   0.0000' at graph 1.30, .85
 set label 'V1'  at graph 1.05, 0.80
set label '0.9992' at graph 1.15, .80
set label ' -13.3969' at graph 1.30, .80
 set label 'V2'  at graph 1.05, 0.75
set label '0.9992' at graph 1.15, .75
set label '  13.3969' at graph 1.30, .75
 set label 'Vx'  at graph 1.05, 0.70
set label '0.2522' at graph 1.15, .70
set label '-113.3616' at graph 1.30, .70
 set label 'Vy'  at graph 1.05, 0.65
set label '0.2522' at graph 1.15, .65
set label ' 113.3616' at graph 1.30, .65
 set label 'Is'  at graph 1.05, 0.60
set label '0.8124' at graph 1.15, .60
set label '   3.2259' at graph 1.30, .60
 set label 'Ir'  at graph 1.05, 0.55
set label '0.8124' at graph 1.15, .55
set label '  -3.2259' at graph 1.30, .55
 set label 'Im'  at graph 1.05, 0.50
set label '0.0914' at graph 1.15, .50
set label '  90.0000' at graph 1.30, .50
 set label 'Val' at graph 1.05, 0.40
 set label 'Re' at graph 1.15, 0.40
 set label 'Im' at graph 1.30, 0.40
 set label 'Ss' at graph 1.05, 0.35
set label ' 1.1000' at graph 1.15, .35
set label ' 0.3316' at graph 1.30, .35
 set label 'S1' at graph 1.05, 0.30
set label ' 1.1000' at graph 1.15, .30
set label '-0.3284' at graph 1.30, .30
 set label 'S2' at graph 1.05, 0.25
set label ' 1.1000' at graph 1.15, .25
set label ' 0.3284' at graph 1.30, .25
 set label 'Sr' at graph 1.05, 0.20
set label ' 1.1000' at graph 1.15, .20
set label '-0.3316' at graph 1.30, .20
 set label 'Sm' at graph 1.05, 0.15
set label ' 0.0000' at graph 1.15, .15
set label '-0.1386' at graph 1.30, .15
 set label 'Sx' at graph 1.05, 0.10
set label ' 0.1297' at graph 1.15, .10
set label ' 0.2591' at graph 1.30, .10
 set label 'Sy' at graph 1.05, 0.05
set label '-0.1297' at graph 1.15, .05
set label ' 0.2591' at graph 1.30, .05
 plot [t=-pi:pi] xc= 0.9689088 , yc= 0. , r= 0.10310912 , xc+r*cos(t), yc+r*sin(t) with lines lt 2 notitle, \
      '-' using 1:2:3:4 with vectors head filled lt 1 title 'Vs, Vx', \
      '-' using 1:2:3:4 with vectors head empty  lt 1 title 'Is', \
      '-' using 1:2:3:4 with vectors head filled lt 3 title 'Vr,Vy', \
      '-' using 1:2:3:4 with vectors head empty  lt 3 title 'Ir', \
      '-' using 1:2:3:4 with vectors head filled lt 2 title 'Vm'
 0. 0. 0.9396926 0.34202015
 1.0720179 0. -0.100000024 -0.23151213
 e
 0. 0. 0.81109715 0.045714878
 e
 0. 0. 0.9396926 -0.34202015
 1.0720179 0. -0.100000024 0.23151213
 e
 0. 0. 0.81109715 -0.045714878
 e
 0. 0. 1.0720179 0.
 e
 unset label 
