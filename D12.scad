
cube_side = 20;
rot_angle = 360/5;
gamma1 = 2*asin(sin(54)/cos(18));
gamma2 = 90+asin(cos(18)*cos(gamma1/2)/cos(54));
r = cube_side/2 / tan(36);
R = cube_side/2 / sin(36);
cube_height = cube_side*cos(gamma2 - 90) + (r+R)*cos(gamma1-90);
//gamma1 = 116.57;
//gamma2 = 148.28;
//r = 13.76;
//R = 17.01;
//cube_height = 38.035;

module letter(l){
    mirror([180, 0, 0])
    linear_extrude(cube_side/2, center=true) text(l, 5, "3270 Nerdfont", halign = "center", valign = "center");
}

module rotated_cube(angle, magic_angle, side, slant_height, letter, cutoff_thickness = 8){
    
    rotate([0, 0, angle])
        
    translate([0, r, 0])
    rotate([magic_angle, 0, 0])
    translate([0, cutoff_thickness/2, slant_height/2])
    union(){
        cube([side, cutoff_thickness, slant_height], center = true);
        rotate([90, 0, 0])
        translate([0, -side/16, 0])
        letter(letter);
    }
    
}
strings = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11"];


//scale([1.25, 1.25, 1.25])
difference(){
//    color("#444444")
    sphere(r = cube_side*1.47);
    
    for(j = [0:1:1]){
        rotate([180*j, 0, 0])
        translate([0, 0, -cube_height*0.585])
            union(){
                for(i = [1:1:5]){    
                    rotated_cube(rot_angle*i, -gamma1+90, R*2, r+R, strings[j*5+i-1]);
                }
            translate([0, 0, -4])
            rotate([0, 0, 180])
            union(){
                cylinder(h=8, r=r*2, center=true);
                letter(str(12^j));
            }
        }    
    }
}