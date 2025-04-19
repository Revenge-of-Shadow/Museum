//  R is always counted without the teeth.
r_small = 5;
r_big = 15;

cylinder(10, 3, 3);
translate([r_small+r_big, 0, 0])
cylinder(10, 3, 3);

translate([20/2, 0, 0])
cube([40, 20, 2], center = true);