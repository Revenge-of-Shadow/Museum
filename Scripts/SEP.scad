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
        
    }

    color("black")
    translate([5, 0, 0])
    scale([0.8, 0.8, 1])
    rotate([0, 180, 0])
    translate([0, 0, 1])
    linear_extrude(1){
        
        polygon(
            [
            [0, 8],
            [2, 8],
            [-1, 1],
            [4,  1],
            [-1, -6.25],
            [0, -6.5],
            [-2.25, -8],
            [-3, -5.75],
            [-2, -6],
            [1, -1],
            [-4,-1]
        ]
        );
    };
    color("black")
    translate([2.3, 0, 0])
    scale([0.5, 1.3, 1])
    rotate([0, 180, 0])
    translate([0, 0, 1])
    linear_extrude(1){
        text("EP", size = 20, "3270 Nerd Font", halign="left", valign="center");
        translate([2.5, 0, 0])
        square([1, 9], center=true);
        translate([11.5, 0, 0])
        square([1, 9.33], center=true);
    };
}