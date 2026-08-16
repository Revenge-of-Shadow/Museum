module letter(l){
    mirror([180, 0, 0])
    linear_extrude(side/8, center=true) text(l, 5, "3270 Nerdfont", halign = "center", valign = "center");
}

module rotated_cube(angle, magic_angle, side, slant_height, cutoff_thickness = 4){
    rotate([magic_angle, 0, angle])
    translate([0, cutoff_thickness/2, slant_height/2])
    cube([side+2, cutoff_thickness, slant_height+2], center = true);
    
    rotate([0, 0, angle])
    translate([0, cutoff_thickness/2, slant_height/2])
    cube([side+2, cutoff_thickness, slant_height+2], center = true);
    
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
side = 20;

//  Following are also counted within a module; here they are needed as well.
alpha = 360/side_amount;        //  Angle between the segments.
beta = 90 - (alpha/2);          //  Angle between the radius and the side.

l = tan(beta) * side/2;    //  Apothem.
r = side/2 * 1/cos(beta);
height = sqrt(pow(side, 2) - pow(r ,2));    //  Of the pyramid.

epsylon = atan(r/height);
delta = 180-2*epsylon;

displacement = (side/(2*cos(epsylon)) - height);


str_top = ["01", "02", "03", "04", "05"];
str_bottom = ["06", "07", "08", "09", "10"];
str_side_top = ["11", "12", "13", "14", "15"];
str_side_bottom = ["16", "17", "18", "19", "20"];

difference(){
    color("Gray", 1.0)
    union(){
        sphere(15);
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
            
            //  For balance
            
            rotate([180, 0, 0])
            rotate([0, 0, 360/5*i])
            rotate([delta, 0, 0])
            rotate([0, 0, 180])
            translate([0,0,displacement])
            the_pyramid(height, side_amount, side);
        }
    }
    color("White", 1.0)
    for(i = [0: 1: 4]){
            
            //  Top
            translate([0,0,displacement])
            rotate([0, 0, 360/5*(i+0.5)])
            rotate([-delta-epsylon, 0, 0])
            translate([0,0,-side/2*sin(epsylon)])
            rotate([0, 0, 180])
            letter(str_top[i]);
            
            //  Bottom
            rotate([180, 0, 0])
            translate([0,0,displacement])
            rotate([0, 0, 360/5*(i+0.5)])
            rotate([-delta-epsylon, 0, 0])
            translate([0,0,-side/2*sin(epsylon)])
            rotate([0, 0, 180])
            letter(str_bottom[4-i]);
        
            //  Side top
            translate([0, 0, (height-r)/(r/height)])
            rotate([0, 0, 360/5*i])
            rotate([delta, 0, 0])
            translate([0,0,displacement])
            rotate([90-epsylon, 0, 0])
            translate([0,0,cos(90-epsylon)*height*0.9])
            mirror([180, 0, 0])
            letter(str_side_top[i]);
        
            //  Side bottom
            rotate([180, 0, 0])
            translate([0, 0, (height-r)/(r/height)])
            rotate([0, 0, 360/5*i])
            rotate([delta, 0, 0])
            translate([0,0,displacement])
            rotate([90-epsylon, 0, 0])
            translate([0,0,cos(90-epsylon)*height*0.9])
            mirror([180, 0, 0])
            letter(str_side_bottom[i]);
            
        }
}