
include <bracket-common.scad>;

$fn=50;

bracketTop();

module bracketTop(){
    difference(){
        union(){
            topPlate();
            rotatedHandleHolder();
        }
        handleHole();
    }
}

handleAngle = 20;
handleHolderOffsetY = -3;

module rotatedHandleHolder(){
    intersection(){
        rotate([handleAngle,0,0]){
            handleHolder();
        }
        translate([0,0,50]){
            cube(100, center=true);
        }
    }
}

module handleHole(){
    radius = 23 / 2;
    rotate([handleAngle,0,0]){
        translate([0,handleHolderOffsetY,0]){
            cylinder(200,radius,radius, center=true);
        }
    }
}

module handleHolder(){
    outerRadius = 30/2;
    translate([0,handleHolderOffsetY,-10]){
        cylinder(70,outerRadius,outerRadius);
        fin(0);
        fin(90);
        fin(180);
        fin(270);
    }
}

module fin(zRotation){
    finAngle = 18;
    rotate([0,-finAngle,zRotation]){
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
