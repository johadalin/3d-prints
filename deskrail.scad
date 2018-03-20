union(){
  rotate([90,0,0])linear_extrude(height=30)
  // The cross section of a platform with the rail slots
  union(){
      foot();
      translate([30.1,0,0])mirror()foot();
      top();
  };

  // Add the design/object you want to mash up with the rail mount here
  // Make sure the two objects just intersect, and you don't fill any of the gaps in the rail mount
  // Commented out because if you try to open it with an import that doesn't exist, it will bork
//  translate([15,-7,6.45])
//  rotate([0,0,0])
//  scale([0.6,0.6,0.6])import("C:/Users/AJL/Downloads/low_poly_yellow_cat.stl");
}


// These measurements work. All numbers are magic, as measured
module foot(){
translate([1.8,0,0])union(){
    square([12.5, 2.6]);
    translate([2.6,0,0])square([6.7, 5.4]);
    }
}

module top(){
    translate([0,5.3])square([30.1,1.5]);
}
    
