
include <bracket-common.scad>;

$fn=50;

bracketTop();

module bracketTop(){
    difference(){
        union(){
            topPlate();
            translate([0,0,-10]){ //workaround to make make it work short-term
                rotatedHandleHolder();
            }
        }
        translate([0,0,-10]){ //workaround to make make it work short-term
            handleHole();
        }
    }
}

module rotatedHandleHolder(){
    intersection(){
        rotate([20,0,0]){
            handleHolder();
        }
        translate([0,-5,50]){
            cube([100,70,80], center=true);
        }
    }
}

module handleHole(){
    radius = 23 / 2;
    rotate([20,0,0]){
        translate([0,0,-10]){
            cylinder(90,radius,radius);
        }
    }
}

module handleHolder(){
    translate([0,0,-10]){
        cylinder(80,15,15);
    }
    fin(0);
    fin(90);
    fin(180);
    fin(270);
}

module fin(zRotation){
    rotate([0,-18,zRotation]){
        translate([18,0,15]){
            cube([20,5,80], center=true);
        }
    }
}


module topPlate(){
    plateHeight = 12;
    holeX = 50;
    holeY = 0;
    difference(){
        plate3d(plateHeight);
        translate([-holeX, holeY, 0]){
            m5countersinkScrew();
        }
        translate([holeX, holeY, 0]){
            m5countersinkScrew();
        }
    }
}

module m5countersinkScrew(){
    holeRadius = 5.2 / 2;
    holeHeigth = 50;
    headRadius = 9.5 / 2;
    headHeight = 4;
    translate([0, 0, -headHeight]){
        cylinder(headHeight, holeRadius, headRadius);
    }
    translate([0,0,-53]){
        cylinder(holeHeigth, holeRadius, holeRadius);
    }
}



