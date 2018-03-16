union(){rotate([90,0,0])linear_extrude(height=30)
union(){
    foot();
    translate([30.1,0,0])mirror()foot();
    top();
};
/*translate([15,-7,6.45])
rotate([0,0,0])
scale([0.6,0.6,0.6])import("C:/Users/AJL/Downloads/low_poly_yellow_cat.stl");*/
}
module foot(){
translate([1.8,0,0])union(){
    square([12.5, 2.6]);
    translate([2.6,0,0])square([6.7, 5.4]);
    }
}


module top(){
    translate([0,5.3])square([30.1,1.5]);
}
    
