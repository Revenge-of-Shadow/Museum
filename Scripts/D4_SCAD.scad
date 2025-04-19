
module draw_rot_dig(a, angle, dist){
    
        translate([-cos(angle)*dist, -sin(angle)*dist, 0])
        rotate([0, 180, angle+90])
        linear_extrude(4){
            text(a, 5, font = "3270 Nerdfont", halign = "center", valign = "center");
        }
    
}

module example003()
{
    cube_side = 20;
    magic_dist = 16.2 * (cube_side/20);
    magic_degree = 70.52;// Just a tangent.
    
          color("#444444")
    scale([0.5, 0.5, 0.5])
  difference() {
        translate([0, 0, 0])
      difference(){
        union() {
          color("black")
          cylinder(2*cube_side, 1.5*cube_side, center = true);
        }
    
        union() {
          //color("red")
            union(){
                translate([magic_dist, 0, 0])
                rotate([0, magic_degree, 0])
                cube([4*cube_side, 4*cube_side, cube_side], center = true);
            };
          //color("blue")
            union(){
                translate([cos(-120)*magic_dist, sin(-120)*magic_dist, 0])
                rotate([0, magic_degree, -120])
                cube([4*cube_side, 4*cube_side, cube_side], center = true);
            };
          //color("green")
            
            union(){
                translate([cos(120)*magic_dist, sin(120)*magic_dist, 0])
                rotate([0, magic_degree, 120])
                cube([4*cube_side, 4*cube_side, cube_side], center = true);
            };
        }
    };
        
        translate([0, 0, -8])
        union(){
        
            translate([magic_dist/2, 0, 0])
            rotate([0, magic_degree, 0])
            rotate([0, 180, 180])
            
            union(){
                    draw_rot_dig("4", 0, cube_side*3/4);
                    draw_rot_dig("2", -120, cube_side*3/4);
                    draw_rot_dig("3", 120, cube_side*3/4);
            };
            
            rotate([0, 0, -120])
            translate([magic_dist/2, 0, 0])
            rotate([0, magic_degree, 0])
            rotate([0, 180, 180])
            
            union(){
                    draw_rot_dig("4", 0, cube_side*3/4);
                    draw_rot_dig("1", -120, cube_side*3/4);
                    draw_rot_dig("2", 120, cube_side*3/4);
            };
            
            rotate([0, 0, 120])
            translate([magic_dist/2, 0, 0])
            rotate([0, magic_degree, 0])
            rotate([0, 180, 180])
            
            union(){
                    draw_rot_dig("4", 0, cube_side*3/4);
                    draw_rot_dig("3", -120, cube_side*3/4);
                    draw_rot_dig("1", 120, cube_side*3/4);
            };
            
            
            translate([0, 0, -magic_dist*0.725])
            union(){
                draw_rot_dig("1", 0, cube_side*3/4);
                draw_rot_dig("2", 120, cube_side*3/4);
                draw_rot_dig("3", -120, cube_side*3/4);
            };
            
        };
        
        
  }
}

echo(version=version());

example003();

// Written by Clifford Wolf <clifford@clifford.at> and Marius
// Kintel <marius@kintel.net>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
