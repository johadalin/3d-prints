$fn=60;
// Measurements assumed as mm
loop_height=25; // Internal measurement: bottom of 'leg' to top of arch
loop_width=31.1; // Internal measurement: distance between legs desk is 31, add .5 for minkowski
pla_width=3; // thickness legs are printed
hook_depth=21; // Internal measurement: gap between arch and hook lip
hook_height=2.5; // Internal measurement: height of hook lip
//rounding_factor=0.1; // Size of circle relative to pla_width used to minkowski smooth off 2d shape sharp edges
print_height=8; // height to extrude hook shape

linear_extrude(height=print_height){
    roundedhook(loop_height, loop_width, pla_width, hook_depth, hook_height);
    };

//linear_extrude(height=print_height){roundedhook(loop_height, loop_width, pla_width, hook_depth, hook_height);}

module hook(loop_height, loop_width, pla_width, hook_depth, hook_height){
    union(){
        loop(loop_height, loop_width, pla_width);
        translate([loop_width + pla_width, 0])rounded_square((2*pla_width + hook_depth), pla_width);
        translate([loop_width + 2*pla_width + hook_depth, 0])rounded_square(pla_width, hook_height);
        }
    }


module loop(height, width, depth){
    union(){
        rounded_square(depth, height+depth);
        translate([0,height])rounded_square((2*depth + width), depth);
        translate([width+depth,0])rounded_square(depth, height+depth);
        translate([pla_width/4,height-16.5])rotate([0,0,90])semicircle(4.5); // magic number 14 is 12mm top to gap, + circle rad
        translate([width+depth+(3/4*pla_width),height-16.5])rotate([0,0,270])semicircle(4.5);
        }
        // Add small circles to latch into divider notches
    }
    
module roundedhook(loop_height, loop_width, pla_width, hook_depth, hook_height){
    union(){
        loop(loop_height, loop_width, pla_width);
        translate([loop_width + 2*pla_width + hook_depth/2, 0.5])semi_arc(hook_depth/2, pla_width);
        translate([loop_width + 2*pla_width + hook_depth, 0])rounded_square(pla_width, hook_height);
        }
    }

//!rounded_square(10, 40);
// rounding has to be based on the smalled dimension, so we don't draw a square with 0
module rounded_square(width, length){
    rounding= width>length ? length*0.2 : width*0.2;
    translate([rounding, rounding])
    minkowski(){
        square([width-(2*rounding), length-(2*rounding)]);
        circle(rounding);
    }
}

module semi_arc(radius, width){
    difference(){
    semicircle(radius+width);
    circle(r=radius);
    }
}
module semicircle(radius){
difference(){
    circle(r=radius);
    translate([-radius,0])square(2*radius);
    }
}



