base_length = 32;
translate([0,-80, base_length/2-2])
cube([80, 2, base_length], center = true);

len = 42;
translate([0,-len+5,-1])
cube([10, len*2, 2], center = true);
cylinder(h= 6, r = 3.5, center = false);



tri_rad = 10;
scale([2, 1, 1])
translate([0,-80+tri_rad/2, -2])
rotate([0,0,90])
linear_extrude(8){
    polygon([for(i = [1:1:3]) [tri_rad*cos(i*360/3), tri_rad*sin(i*360/3)]]);
}