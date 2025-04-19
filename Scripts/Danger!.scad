r = 20;
module triangle(l, r){
    linear_extrude(l){
        polygon([
            [cos(90)*r, sin(90)*r],
            [cos(210)*r, sin(210)*r],
            [cos(330)*r, sin(330)*r]
        ]);
    }
}

scale([1.5, 1.5, 1.5])
union(){
    difference(){
        translate([0, 0, -2])
        triangle(4, r);
        
        translate([0, 0, 1])
        triangle(1, r-4);
        rotate([0, 180, 0])
        translate([0, 0, 1])
        triangle(1, r-4);
        
        translate([0, 0, -2])
        translate([0,r-6,0])
        triangle(4, 2);
    }


    translate([0, 0, 1])
    linear_extrude(1){
        translate([0, -1/5*r, 0])
        circle(2);
        
        polygon(
            [
            [-1, 0],
            [1, 0],
            [2, 10],
            [-2, 10]
        ]
        );
    }

    rotate([0, 180, 0])
    translate([0, 0, 1])
    linear_extrude(1){
        
        polygon(
            [
            [-2, 10],
            [2, 10],
            [-1, 2],
            [5,  2],
            [-1, -7],
            [1, 0],
            [-5,0]
        ]
        );
    }
}