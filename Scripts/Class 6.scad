
difference(){
    union(){
    difference(){
        color("black")
        linear_extrude(4){
            circle(22.5);
        }
            
        color("red")
        translate([0,0,2])
        linear_extrude(4){
            circle(20);
        }
    }
        color("black")
    union(){
    translate([0,0,3])
    cube([6,16,2], center = true);
    
    translate([0, 10, 1])
    difference(){
        linear_extrude(3){
            circle(6);
        }
        
            angles = [for (i = [0:5]) (i*360/6)];
            coords = [for (th=angles) [3*cos(th), 3*sin(th)]];
        translate([0, 1, 0])
        rotate([0,0,90])
        linear_extrude(4){
                    polygon(coords);
        };
        
        translate([0, 4, 0])
        cube([5.2,5.2,8], center = true);
    }
    translate([0, -10, 1])
    difference(){
        linear_extrude(3){
            circle(6);
        }
        
            angles = [for (i = [0:5]) (i*360/6)];
            coords = [for (th=angles) [3*cos(th), 3*sin(th)]];
        translate([0, -1, 0])
        rotate([0,0,90])
        linear_extrude(4){
                    polygon(coords);
        };
        
        translate([0, -4, 0])
        cube([5.2,5.2,8], center = true);
    }
}}
    
    
    
    
        
        translate([0,0,2])
        rotate([0, 90, 90])
        cube([2, 2, 4], center = true);
        
        translate([0,4,0.7])
        rotate([60, 0, 0])
        cube([2, 2, 6], center = true);
        
        translate([0,-4,0.7])
        rotate([-60, 0, 0])
        cube([2, 2, 6], center = true);
}
        