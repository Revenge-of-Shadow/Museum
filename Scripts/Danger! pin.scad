r = 20;
module triangle(l, r){
    linear_extrude(l){
        polygon([
            [cos(90)*r, sin(90)*r],
            [cos(210)*r, sin(210)*r],
            [cos(330)*r, sin(330)*r]
        ]);
    }
}

module pin_part(){
            translate([0,0,2])
            rotate([0, 90, 90])
            cube([2, 2, 4], center = true);
            
            translate([0,4,0.65])
            rotate([60, 0, 0])
            cube([2, 2, 6], center = true);
            
            translate([0,-4,0.65])
            rotate([-60, 0, 0])
            cube([2, 2, 6], center = true);
}

scale([1.5, 1.5, 1.5])
union(){
    difference(){
        color("black")
        translate([0, 0, -2])
        triangle(4, r);
        
        color("yellow")
        rotate([0, 180, 0])
        translate([0, 0, 1])
        triangle(2, r-4);
        
        translate([0, 0, 4])
        rotate([0, 180, 90])
        pin_part();
    }
    translate([0, 0, 1.5])
    scale([0.8, 0.8, 0.6])
    pin_part();

    rotate([0, 180, 0])
    translate([0, 0, 1])
    color("black")
    linear_extrude(1){
        translate([0, -1/5*r, 0])
        circle(2);
        
        polygon(
            [
            [-1, 0],
            [1, 0],
            [2, 10],
            [-2, 10]
        ]
        );
    }
}