// Base tile

module base_tile(
    size,
    height, 
    brim,
    brim_depth){
    
        translate([0,0,height/2])
        cube([size,size,height], center=true);
        
        translate([0,0,height/2+brim_depth])
        cube([size-brim,size-brim,height], center=true);
        
        
}

module peg_holes(
    size,
    peg_diameter,
    peg_depth,
    latch_1,
    latch_2,
    latch_3,
    latch_4){
        depth = peg_depth/2-0.001;
        rad = peg_diameter/2;
        
        if (latch_2) {
            translate([-size/2+peg_diameter,size/2-peg_diameter,depth])
            cylinder(h=peg_depth, r=rad, center=true);
        }
        if (latch_1) {
            translate([size/2-peg_diameter,size/2-peg_diameter,depth])
            cylinder(h=peg_depth, r=rad, center=true);
        }
        if (latch_3) {
            translate([size/2-peg_diameter,-size/2+peg_diameter,depth])
            cylinder(h=peg_depth, r=rad, center=true);
        }
        if (latch_4) {
            translate([-size/2+peg_diameter,-size/2+peg_diameter,depth])
            cylinder(h=peg_depth, r=rad, center=true);
        }
}

module peggify(
    size,
    peg_diameter,
    peg_depth,
    latch_1,
    latch_2,
    latch_3,
    latch_4){
        
        difference() {
            children(0);
            peg_holes(
                size=size,
                peg_diameter=peg_diameter,
                peg_depth=peg_depth,
                latch_1=latch_1,
                latch_2=latch_2,
                latch_3=latch_3,
                latch_4=latch_4);
        }
}

module mag_holes(
    size,
    mag_diameter,
    mag_top,
    mag_right,
    mag_bottom,
    mag_left) {
        
        if (mag_top) {
            translate([0, size/2-mag_diameter/2-1,0])
            sphere(r=mag_diameter/2, center=true);
        }
        if (mag_right) {
            translate([size/2-mag_diameter/2-1,0,0])
            sphere(r=mag_diameter/2, center=true);
        }
        if (mag_bottom) {
            translate([0, -size/2+mag_diameter/2+1,0])
            sphere(r=mag_diameter/2, center=true);
        }
        if (mag_left) {
            translate([-size/2+mag_diameter/2+1,0,0])
            sphere(r=mag_diameter/2, center=true);
        }
}

module maggify(
    size,
    mag_diameter,
    mag_top,
    mag_right,
    mag_bottom,
    mag_left){
        
        difference() {
            children(0);
            mag_holes(
                size=size,
                mag_diameter=mag_diameter,
                mag_top=mag_top,
                mag_right=mag_right,
                mag_bottom=mag_bottom,
                mag_left=mag_left);
        }
}

module tile(
    size=28,
    height=4, 
    brim=0.75,
    brim_depth=0.75,
    peg_diameter=4,
    peg_depth=2.5,
    mag_diameter=5.5,
    latch_1=true,
    latch_2=true,
    latch_3=true,
    latch_4=true,
    mag_top=true,
    mag_right=true,
    mag_bottom=true,
    mag_left=true){
        rotate([0,180,0])
        translate([0,0,-height-brim_depth])
        peggify(
            size=size,
            peg_diameter=peg_diameter,
            peg_depth=peg_depth,
            latch_1=latch_1,
            latch_2=latch_2,
            latch_3=latch_3,
            latch_4=latch_4) {
                maggify(
                    size=size,
                    mag_diameter=mag_diameter,
                    mag_top=mag_top,
                    mag_right=mag_right,
                    mag_bottom=mag_bottom,
                    mag_left=mag_left){
                    base_tile(
                        size=size,
                        height=height, 
                        brim=brim,
                        brim_depth=brim_depth);
                }
        }
}


$fa = 1;
$fs = 0.4;

tile();