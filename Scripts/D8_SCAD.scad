
cube_size = 20;
cube_height = cube_size*sqrt(2);
magical_angle = 54.74;

module preset_cube(){
    
        cube([cube_size, cube_size, cube_height], center = true);
}

module triangle_cut(){
    translate([0, cube_size*6/7, cube_height/2])
    rotate([-magical_angle, 0, 0])
    preset_cube();
                
    translate([0, -cube_size*6/7, cube_height/2])
    rotate([magical_angle, 0, 0])
    preset_cube();
}

module letter(l){
    translate([0, cube_size*6/7, cube_height/2])
    rotate([-magical_angle, 180, 180])
    mirror([180, 0, 0])
    linear_extrude(29, center=true) text(l, 5, "3270 Nerdfont", halign = "center", valign = "center");
}

difference(){

    union(){
          color("#444444")
            preset_cube();
        };


    
        union(){
            color("black")
            triangle_cut();
            
            rotate([0,0,90])
            color("white")
            triangle_cut();
        };
        
        rotate([180,0,0])
        union(){
            color("black")
            triangle_cut();
            
            rotate([0,0,90])
            color("white")
            triangle_cut();
        };
        
        string = "1234";
        
        union(){
            for ( i = [0:1:4]) 
                rotate([0,0,90*i])
                letter(string[i]);
        };
        
        
        string2 = "5678";
        rotate([180,0,0])
        union(){
            for ( i = [0:1:4]) 
                rotate([0,0,90*i])
                letter(string2[i]);
        }
}