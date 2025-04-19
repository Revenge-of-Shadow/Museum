difference(){
union(){
        r = 30;
    linear_extrude(5){
     difference(){
         angles=[ for (i = [0:5]) i*(360/6) ];
         coords=[ for (th=angles) [r*cos(th), r*sin(th)] ];
         polygon(coords);
         
         circle(20);
    }
}
    translate([0,0,0])
    linear_extrude(7){
    polygon([
        [-10, 30],
        [10, 35],
        [3, 5],
        [18, 5],
        [-7, -35],
        [0, -5],
        [-13, -5]
    ]);}
}
translate([0,28,-3])
linear_extrude(16)
circle(2);
}