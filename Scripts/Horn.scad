spring_idle = 25;
radius = 15;
module rotated_cube(angle, magic_angle, cube_side, cube_height){
    color("white")
    rotate([magic_angle, 0, angle])
    translate([0, cube_side, 0])
    cube([cube_side*2, cube_side, cube_height], center = true);
}

module hook(){
    color("red")
    rotate([0,0,180])
    union(){
        inner_rad = 9;
        
        translate([0,0,-1.2])
        
        linear_extrude(20){
            polygon([for(i = [1:10:180]) [inner_rad*cos(i), inner_rad*sin(i)]]);
        }
        
        rotate([0,180,0])
        difference(){
            translate([0, 0, 0])
            cube([3,4,2.3], center = true);
            translate([0,0,-2])
            rotate([0, 0, 0])
            cube([5,2,4], center = true);
        }
    }
}

step = 4;
steps = 8;
angle = 360;
small = 0.8;

//  Horn
union(){
    
    //scale(25/15){
        difference(){
            union(){
                difference(){
                    color("#004444")
                    translate([0,0,-16.6725])
                    difference(){
                        union(){
                            translate([0, -5.8*25/15, 40*25/15])
                            rotate([20, 0, 0])
                            cylinder(36*25/15, 8*25/15, 4*25/15, center = true);
                                
                        }
                        union(){
                            translate([0, -5.8*25/15, 40*25/15])
                            rotate([20, 0, 0])
                            for(i = [0:1:steps]){
                               rotated_cube(angle/steps*i, 12, 6*25/15, 40*25/15);
                            };
                            
                        }
                    }
                    
                    color("#4444EE")
                    union(){
                        translate([0, 0, 5.5*25/15])
                        cube([40*25/15, 40*25/15, 33.325], center = true);
                        translate([0, 0, -2.2*25/15])
                        cylinder(34, 5*25/15, 5*25/15);
                    }
                }
                
                difference(){
                    translate([0, 0, 26.5])
                    rotate([0, 0, 180])
                    hook();
                    
                    translate([0, -5.8*25/15, 40*25/15-16.6725])
                    rotate([20, 0, 0])
                    for(i = [0:1:steps]){
                        rotated_cube(angle/steps*i, 12, 6*25/15, 40*25/15);
                    };
                }
                
                difference(){
                    translate([0, 0, -1.2*25/15])
                    cylinder(16.7*25/15, 10*25/15, 10*25/15);
                    
                    translate([0, 0, 16*25/15])
                    for(i = [0:1:steps]){
                       rotated_cube(angle/steps*i, 0, 13.5*25/15, 40*25/15);
                    }
                    translate([0, 0, -2.2*25/15])
                    cylinder(32*16/25*25/15, 5*25/15, 5*25/15);
                }
            }
        }
    //}

        
        for(i = [0:1:4]){
                rotate([0, 0, 90*i])
                translate([12+1, 0, -1])
                cube([4, 6, 2], center = true);
        }

        
}