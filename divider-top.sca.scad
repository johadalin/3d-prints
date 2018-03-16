xa = 30;
ya = 33.3;
za = 6.6;

cube(size=[xa,ya,za], center=true);

// Front flange
/*
translate(v=[0,4.75,-2]){
    cube(size=[10,0.5,4], center=true);
}*/

depth = 10;
guard = 2;

zoff = depth/2;

// Front flanges
yb = 10;
tyb = ((ya)/2) - (yb/2) - guard - 2.4;

xb = 7.3;
txb = ((xa)/2) - (xb/2) - guard;

// Center left flange
translate(v=[-txb,tyb,-zoff]){
    cube(size=[xb,yb,depth], center=true);
}

// Center right flange
translate(v=[txb,tyb,-zoff]){
    cube(size=[xb,yb,depth], center=true);
}

// Rear flanges

yc = 6.6;
tyc = ((ya) / 2) - (yc / 2) - guard + 0.2;

xc = 7.3;
txc = ((xa) / 2) - (xc / 2) - guard;

// Rear left flange
translate(v=[-txc,-tyc,-zoff]){
    cube(size=[xc, yc,depth], center=true);
}

// Rear right flange
translate(v=[txc,-tyc,-zoff]){
    cube(size=[xc,yc, depth], center=true);
}