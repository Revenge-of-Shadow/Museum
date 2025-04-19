cube_side = 20;
letter_depth = 2;



module print_symb(l){
        linear_extrude(letter_depth){
                text(l, 5, "3270 Nerdfont", halign="center", valign = "center");
        }
}

color("#444444")
difference(){
    cube([cube_side,cube_side,cube_side],center=true);
    
    numbers = "123456";
    
    for(i = [0:1:3])    
        rotate([90,0,90*i])
        translate([0,0,cube_side/2-letter_depth/2])
        print_symb(numbers[i]);
    for(i = [0:1:1])    
        rotate([0,90+180*i,0])
        translate([cube_side/2-letter_depth/2,0,0])
        rotate([0,90,0*i])
        print_symb(numbers[4+i]);
}
    