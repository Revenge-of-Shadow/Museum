
rot_angle = 360/5;
magic_angle = 45;
cube_side = 20;
cube_height = cube_side/sin(magic_angle);

module rotated_cube(angle, l){
    color("white")
    rotate([magic_angle, 0, angle])
    translate([0, cube_side, 0])
    cube([cube_side, cube_side, cube_height], center = true);
    
    color("white")
    translate([0, 0, -cube_side/4])
    rotate([magic_angle, 0, angle])
    translate([0, cube_side, 0])
    rotate([0, 90, 90])
    rotate([0, 0, 90])
    linear_extrude(14, center=true){
        text(l, 5, "3270 Nerdfont", halign = "center", valign = "center");
    }
    
}

scale([1.25, 1.25, 1.25])
difference(){
    color("#444444")
    //cylinder(h = cube_height, r = cube_side/2, center = true);
    sphere(r = cube_side*4/5);
    //cube([cube_side, cube_side, cube_height], center = true);
    
    
    for(i = [1:1:5]){
        rotated_cube(rot_angle*i, str(i*1));
    }
    rotate([180, 0, 0])
    for(i = [6:1:10]){
        rotated_cube(rot_angle*i, str(i*1));
    }
}