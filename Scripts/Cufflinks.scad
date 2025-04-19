scale([2,2,2])
union(){
    max_width = 5/sqrt(2);

    //  Main part
    r_big = 10;
    r_small = 3;

    points = [for(i=[0: 1: 9]) [i%2? cos(36*i)*r_big : cos(36*i)*r_small, i%2? sin(36*i)*r_big : sin(36*i)*r_small]];
    translate([0,0,max_width/2])
    linear_extrude(2)
    polygon(points);

    difference(){
        cube([max_width, max_width, max_width], center = true);
        cube([max_width-1.5, max_width-1.5, max_width], center = true);
        
        rotate([45, 0, 0])
        cube([max_width, 1, 1], center = true);
        rotate([45, 0, 90])
        cube([max_width, 1, 1], center = true);
    }

    translate([0, 20, 0])
        rotate([180, 0, 0])
    union(){
        translate([0, 0, -0.2])
        cube([max_width-1.6, max_width-1.6, max_width-0.2], center = true);
        
        for(i = [0:3]){
            rotate([0, 0, 90*i])
            translate([max_width/7, 0, 0])
            rotate([45, -45, 0])
            cube([1, 1, 1], center = true);
        }

        scale([0.5, 0.5, 1])
        translate([0, 0, -max_width/2-2])
        linear_extrude(2-0.1) 
            polygon(points);
    }
}