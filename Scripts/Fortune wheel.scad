difference(){
    union(){
            
        translate([0, 0, 1])
        cylinder(h=2, r=20/2, center=true);
        linear_extrude(1){
            rad = 60;
            polygon([for(i = [1:1:8]) [rad*cos(i*360/8), rad*sin(i*360/8)]]);
        }
    }
    
    cylinder(h=8, r=17/2, center=true);
}
