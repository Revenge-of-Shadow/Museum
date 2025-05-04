

module rotated_cube(angle, magic_angle, side, slant_height, cutoff_thickness = 4){
    rotate([magic_angle, 0, angle])
    translate([0, cutoff_thickness/2, slant_height/2])
    cube([side, cutoff_thickness, slant_height], center = true);
    
    rotate([0, 0, angle])
    translate([0, cutoff_thickness/2, slant_height/2])
    cube([side, cutoff_thickness, slant_height], center = true);
    
}

module the_pyramid(height, side_amount, side){
    alpha = 360/side_amount;        //  Angle between the segments.
    beta = 90 - (alpha/2);          //  Angle between the radius and the side.
    l = tan(beta) * side/2;         //  Apothem.
    gamma = atan(l/height);         //  The angle to skew by.
    
    slant_height = sqrt(pow(height, 2)+pow(l,2));
    r = side/2 * 1/cos(beta);      //  Radius of the pyramid.
    
    
    difference(){
        translate([0, 0, height/2])
        cylinder(height, r+0.1, r/10, center = true);
        for(i = [0:1:side_amount]){
           translate([-l*sin(360/side_amount*i), l*cos(360/side_amount*i), 0])
           rotated_cube(360/side_amount*i, gamma, side*2, slant_height);
        };
    }
}

side_amount =   5;
side = 8;

//  Following are also counted within a module; here they are needed as well.
alpha = 360/side_amount;        //  Angle between the segments.
beta = 90 - (alpha/2);          //  Angle between the radius and the side.

l = tan(beta) * side/2;    //  Apothem.
r = side/2 * 1/cos(beta);
height = sqrt(pow(side, 2) - pow(r ,2));    //  Of the pyramid.

epsylon = atan(r/height);
delta = 180-2*epsylon;

displacement = (side/(2*cos(epsylon)) - height);


translate([0,0,displacement])
the_pyramid(height, side_amount, side);

rotate([0, 180, 180])
translate([0,0,displacement])
the_pyramid(height, side_amount, side);


for(i = [0: 1: 4]){
    rotate([0, 0, 360/5*i])
    rotate([delta, 0, 0])
    rotate([0, 0, 180])
    translate([0,0,displacement])
    the_pyramid(height, side_amount, side);
}
