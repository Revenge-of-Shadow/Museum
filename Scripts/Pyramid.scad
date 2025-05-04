

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
           rotated_cube(360/side_amount*i, gamma, cube_side*2, cube_height);
        };
    }
}

side_amount =   5;
cube_side = 8;

the_pyramid(cube_side/2, side_amount, cube_side);
