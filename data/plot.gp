reset
set ylabel 'size(byte)'
set xlabel 'stride(byte)'
set zlabel '%'
set term png enhanced font 'Verdana, 10'
set output 'LLC.png'
set style fill solid
set title 'cache mountain'

set dgrid3d 50,50
set hidden3d
#set cntrparam levels incr 650,20,1000
set contour both
set view 70,40
set ticslevel 0
set zrange [:]
set xtics("s1" 0, "s3" 2,"s5" 4,"s7" 6,"s9" 8, "s11" 10,"s13" 12,"s15" 14,"s17" 16,"s19" 18,"s21" 20,"s23" 22,"s25" 24,"s27" 26,"s29" 28,"s31" 20)
set ytics("256M" 0,"128M" 1,"32M" 3,"8M" 5,"2M" 7,"512k" 9,"128k" 11,"32k" 13)
splot "LLC.dat" matrix with pm3d title 'LLC cache-misses'
