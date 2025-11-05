//  Main part

module wheel(r_small, extrusion)
{
    //  Preset calculations that are based on values picked as visually good.
    teeth = r_small*2*3.14/2.618;
    r_big = r_small + 3;
    echo(teeth);
    angle_amount = teeth*2;
    points = [for(i=[0: 1: angle_amount]) [i%2? cos(360/angle_amount*i)*r_big : cos(360/angle_amount*i)*r_small, i%2? sin(360/angle_amount*i)*r_big : sin(360/angle_amount*i)*r_small]];
    linear_extrude(extrusion)
    polygon(points);
}


difference(){
    union(){
        wheel(15, 2);
        wheel(5.1, 4);
        
    }
    cylinder(4, 3.5, 3.5);
}