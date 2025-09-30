use <grid.scad>
use <pegs.scad>


$fa = 1;
$fs = 0.4;

// pegs
for (i = [0:1:30]) {
    translate([4.2*i-80,-20, 0])
    peg(d=4, l=5);
}

grid(
    tile_size=28,
    num_wide=2,
    num_long=2
);
translate([-60,0,0])
grid(
    tile_size=28,
    num_wide=2,
    num_long=2
);

translate([60,0,0])
grid(
    tile_size=28,
    num_wide=1,
    num_long=2
);
translate([-92,0,0])
grid(
    tile_size=28,
    num_wide=1,
    num_long=2
);

translate([0,60,0])
grid(
    tile_size=28,
    num_wide=2,
    num_long=1
);
translate([-60,60,0])
grid(
    tile_size=28,
    num_wide=2,
    num_long=1
);