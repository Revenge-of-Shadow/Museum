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
    union(){
        inner_rad = 7;
        
        translate([0,0,-2.85])
        
        linear_extrude(4){
            polygon([for(i = [1:10:180]) [inner_rad*cos(i), inner_rad*sin(i)]]);
        }
        
        difference(){
            translate([0, 0, 0])
            cube([3,4,2.3], center = true);
            translate([0,0,-2])
            rotate([0, 0, 0])
            cube([5,2,4], center = true);
        }
    }
}
//  Horn
color("#222222")
union(){
    
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