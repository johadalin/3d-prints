$fn=60;
// Measurements assumed as mm

// Internal measurement: bottom of 'leg' to top of arch
loop_length=40;
// Internal measurement: distance between legs desk is 31
loop_height=25.5; 

////
//Customisable options:
////

// Internal measurement: distance onto the desk the hook goes
loop_length=40;//[20:50]

// Internal measurement: gap between arch and hook lip. 5 for small hook, 21 for headset
hook_depth=21;//[1:40]

// Internal measurement: height of hook lip above semi circle. 2.5 recommended
hook_height=2.5;//[0:25]

// Print height from bed
print_height=7;//[1:15]

// Horizontal thickness of 2d shape
pla_width=3;//[2:5]



linear_extrude(height=print_height){
    deskhook(loop_length, loop_height, pla_width, hook_depth, hook_height);
};

 
module deskhook(loop_length, loop_height, pla_width, hook_depth, hook_height){
    union(){
        loop(loop_length, loop_height, pla_width);
        translate([loop_height/2, loop_length+pla_width+hook_depth/2])rotate([0,0,270])semi_arc(hook_depth/2, pla_width);
    }
}


// The "U" shaped part of the hook that slots over the desk
module loop(height, width, depth){
    union(){
      // Main U shape
        rounded_square(depth, height+depth);
        translate([0,height])rounded_square((2*depth + width), depth);
        translate([width+depth,0])rounded_square(depth, height+depth);
    }
}

    
// Produces a rectangle with rounded corners, starting at [0,0]
// Rounding has to be based on the smaller dimension, so we don't draw a square with negative sides
module rounded_square(width, length){
    rounding= width>length ? length*0.2 : width*0.2;
    translate([rounding, rounding])
    minkowski(){
        square([width-(2*rounding), length-(2*rounding)]);
        circle(rounding);
    }
}

// Semicircle. Go figure
module semicircle(radius){
difference(){
    circle(r=radius);
    translate([-radius,0])square(2*radius);
    }
}

// Cuts one semi-circle with another, to produce an arc
module semi_arc(radius, width){
    difference(){
    semicircle(radius+width);
    circle(r=radius);
    }
}

