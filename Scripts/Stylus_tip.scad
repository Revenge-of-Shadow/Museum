union(){
        cylinder(17, 0.4, 0.4);
    
        translate([0, 0, 18])
        difference(){
            cube([3/sqrt(2), 3/sqrt(2), 2.5], center = true);
            
            for(i = [0:1:6]){
                    rotate([0, -15, 60*i])
                    translate([2,0,0])
                    cube([3,3,4], center=true);
                
                    rotate([0, -60, -60*(i)-30])
                    translate([2,0,0])
                    cube([3,3,4], center=true);
            }
           
           translate([0, 0, 2.5])
           cube([3,3,4], center=true);
            
        }
        
}