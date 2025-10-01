use <tile.scad>

module grid(tile_size=28, num_wide=3, num_long=3) {

    for (x = [0:1:num_wide-1]) {
        for (y = [0:1:num_long-1]){
            latch_1 = x == 0 && y == (num_long-1);
            latch_2 = x == (num_wide-1) && y== (num_long-1);
            latch_3 = x == 0 && y == 0;
            latch_4 = x == (num_wide-1) && y == 0;
            mag_top = y == (num_long-1);
            mag_left = x == (num_wide-1);
            mag_bottom = y == 0;
            mag_right = x == 0;
            
            translate([x*tile_size-(0.001*x),y*tile_size-(0.001*y),0])
            tile(
                size=tile_size,
                latch_1 = latch_1,
                latch_2 = latch_2,
                latch_3 = latch_3,
                latch_4 = latch_4,
                mag_top = mag_top,
                mag_right = mag_right,
                mag_bottom = mag_bottom,
                mag_left = mag_left
            );
        }
    }
    
}

$fa = 1;
$fs = 0.4;

grid(
    tile_size=28,
    num_wide=2,
    num_long=2
);
