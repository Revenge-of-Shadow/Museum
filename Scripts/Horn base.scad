spring_idle = 25;
radius = 15;
module rotated_cube(angle, magic_angle, cube_side, cube_height){
    rotate([magic_angle, 0, angle])
    translate([0, cube_side, 0])
    cube([cube_side*2, cube_side, cube_height], center = true);
}

//  Horn
union(){
    
        translate([0, 0, -20])
        union(){

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
            
            cylinder(h = 4, r = 8, center = true);
        }
        
}