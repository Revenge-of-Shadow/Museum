spring_idle = 25;
radius = 15;
module rotated_cube(angle, magic_angle, cube_side, cube_height){
    color("white")
    rotate([magic_angle, 0, angle])
    translate([0, cube_side, 0])
    cube([cube_side*2, cube_side, cube_height], center = true);
}

module hook(){
    union(){
        translate([0,-3,-1])
        cube([3, 4, 4], center = true);
        difference(){
            rotate([45, 0, 0])
            cube([3,4,4], center = true);
            translate([0,0,-2])
            rotate([45, 0, 0])
            cube([5,3,3], center = true);
        }
        translate([0,-2.5,2])
        cube([3,5, 2], center = true);
    }
}

step = 4;
steps = 8;
angle = 360;
small = 0.8;

//  Horn
color("#222222")
union(){
    
    scale(25/15){
        difference(){
            union(){
                translate([0, 0, -10])
                difference(){
                    translate([0, -5.8, 40])
                    rotate([20, 0, 0])
                    difference(){
                        
                        cylinder(36, 8, 4, center = true);
                        
                        for(i = [0:1:steps]){
                           rotated_cube(angle/steps*i, 12, 6, 40);
                        }
                        
                    }
                    
                    translate([0, 0, 5.5])
                    cube([40, 40, 40], center = true);
                }
                difference(){
                    translate([0, 0, -1.2])
                    cylinder(16.7, 10, 10);
                    translate([0, 0, 16])
                    for(i = [0:1:steps]){
                       rotated_cube(angle/steps*i, 0, 13.5, 40);
                    }
                }
            }
            translate([0, 0, -2.2])
            cylinder(32*16/25, 5, 5);
        }
    }

        translate([0, 0, 27])
        rotate([180, 0, 0])
        hook();
        
        for(i = [0:1:4]){
                rotate([0, 0, 90*i])
                translate([12+1, 0, -1])
                cube([4, 6, 2], center = true);
        }

    //  Base
        translate([0, 0, -20])
        union(){
            translate([0, 0, 0])
            hook();
            

            translate([0, 0, -2])
            rotate([180, 0, 360/16])
            linear_extrude(2){
                polygon([for(i = [0: 360/8: 360]) [12*cos(i), 12*sin(i)]]);
            }    
            
            for(i = [0:1:4]){
                    rotate([0, 0, 90*i])
                    translate([12+1, 0, -3])
                    cube([4, 6, 2], center = true);
            }
            
            difference(){
                    cylinder(h = 4, r = 8, center = true);
                    cylinder(h = 5, r = 7, center = true);
            }
        }
        
}