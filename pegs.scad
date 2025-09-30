
module peg(d, l) {
    half_width = sqrt(3*d)/2;
    translate([0,0,half_width])
    rotate([90,0,0])
    difference() {
        cylinder(d = d, l, $fn=6);
        translate([0,0,-0.5])
        cylinder(d = d/2, l+1, $fn=6);
    }
}

peg(d=4, l=5);
