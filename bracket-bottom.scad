include <bracket-common.scad>;

$fn=50;

bracketBottom();

module bracketBottom(){
    plateHeight = 12;
    holeX = 50;
    holeY = 0;
    difference(){
        plate3d(plateHeight);
        translate([-holeX, holeY, -plateHeight]){
            m5nutWithScrewHole();
        }
        translate([holeX, holeY, -plateHeight]){
            m5nutWithScrewHole();
        }
        cutoutHeight = 5;
        translate([0, 16.5, -cutoutHeight/2]){
            cube([92, 27, cutoutHeight], center=true);
        }
        translate([0, 0, -cutoutHeight/2]){
            cube([12, 60, cutoutHeight], center=true);
        }
    }
}

module m5nutWithScrewHole(){
    screwHoleHeight = 20;
    screwholeRadius = 5.2 / 2;
    m5nut();
    cylinder(screwHoleHeight,screwholeRadius,screwholeRadius);
}

module m5nut(){
    height = 4.8;
    shortDiagonale = 8.15;
    longDiagonale = shortDiagonale * 2 / sqrt(3);
    echo(longDiagonale);
    linear_extrude(height = height, center = false, convexity = 10, twist = 0){
        hexagon(longDiagonale);
    }
}

module hexagon(longDiagonale){
    radius = longDiagonale / 2;
    polygon(points=[
        [radius, 0],
        [radius*cos(60),radius*sin(60)],
        [radius*cos(120),radius*sin(120)],
        [-radius,0],
        [radius*cos(240),radius*sin(240)],
        [radius*cos(300),radius*sin(300)],
    ]);
}



