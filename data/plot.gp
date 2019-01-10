reset
set ylabel 'size(byte)'
set xlabel 'stride(byte)'
set zlabel 'Mb/s'
set term png enhanced font 'Verdana, 10'
set output '2core.png'
set style fill solid
set title 'cache mountain'

set dgrid3d 50,50
set hidden3d
set view 70,40
set ticslevel 0
set zrange [:]
set xtics("s1" 0, "s3" 2,"s5" 4,"s7" 6,"s9" 8, "s11" 10)
set ytics("128M" 0,"32M" 2,"8M" 4,"2M" 6,"512k" 8,"128k" 10,"32k" 12)
splot "2core.txt" matrix with pm3d title '2-cores'
