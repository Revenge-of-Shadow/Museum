

module rotated_cube(angle, magic_angle, cube_side, cube_height, cutoff_thickness = 4){
    rotate([magic_angle, 0, angle])
    translate([0, cutoff_thickness/2, cube_height/2])
    cube([cube_side, cutoff_thickness, cube_height], center = true);
    
    rotate([0, 0, angle])
    translate([0, cutoff_thickness/2, cube_height/2])
    cube([cube_side, cutoff_thickness, cube_height], center = true);
    
}

module the_pyramid(height, side_amount, cube_side){
    alpha = 360/side_amount;    //  Angle between the segments.
    beta = 90 - (alpha/2);      //  Angle between the radius and the side.
    l = tan(beta) * cube_side/2;     //  Apothem.
    gamma = atan(l/height);     //  The angle to skew by.
    
    cube_height = sqrt(pow(height, 2)+pow(l,2));
    r = cube_side/2 * 1/cos(beta);      //  Radius of the pyramid.
    echo(r);
    
    difference(){
        translate([0, 0, height/2])
        cylinder(height, r+0.1, r/10, center = true);
        for(i = [0:1:side_amount]){
           translate([-l*sin(360/side_amount*i), l*cos(360/side_amount*i), 0])
           rotated_cube(360/side_amount*i, gamma, cube_side, cube_height);
        };
    }
}

side_amount =8;
cube_side = 8;
//  Horn
union(){
                    
    
        difference(){
            union(){
                difference(){
                color("#F00000")
                    
                translate([0, -5.8*25/15, 40*25/15])
                rotate([20, 0, 0])
                the_pyramid(cube_side*4, side_amount, cube_side);
                    //  Lower negatives to cut upper part.
                    color("#4444EE")
                    union(){
                        translate([0, 0, 5.5*25/15])
                        cube([40*25/15, 40*25/15, 33.325], center = true);
                        translate([0, 0, -2.2*25/15])
                        cylinder(34, 5*25/15, 5*25/15);
                    }
                }
                
                // Lower part.
                difference(){
                    translate([0, 0, -1.2*25/15])
                    cylinder(16.7*25/15, 10*25/15, 10*25/15);
                    
                    translate([0, 0, 16*25/15])
                    for(i = [0:1:side_amount]){
                       rotated_cube(360/side_amount*i, 0, 13.5*25/15, 40*25/15);
                    }
                    translate([0, 0, -2.2*25/15])
                    cylinder(32*16/25*25/15, 5*25/15, 5*25/15);
                }
            }
        }


        
}