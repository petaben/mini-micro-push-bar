
$fn=50;

// translate([0,0,-30]){
//     bottom();
// }

// topWithHandleHolder();

module topWithHandleHolder(){
    difference(){
        union(){
            top();
            translate([55,0,0]){
                rotatedHandleHolder();
            }
        }
        handleHole();
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
    translate([55,0,0]){
        rotate([20,0,0]){
            translate([0,0,-10]){
                cylinder(90,11,11);
            }
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

bottomPlate();

module bottomPlate(){
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
        cutoutHeight = 3;
        translate([0, 16.5, -cutoutHeight/2]){
            cube([92, 27, cutoutHeight], center=true);
        }
        translate([0, 0, -cutoutHeight/2]){
            cube([12, 60, cutoutHeight], center=true);
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

module plate3d(height){
    translate([0,0,-height]){
        linear_extrude(height = height, center = false, convexity = 10, twist = 0){
            plate2d();
        }
    }
}

module plate2d(){
    cornerX = 35;
    cornerY = 20;
    tipX = 55;
    tipY = 0;

    hull(){
        corner(-tipX,tipY);
        corner(-cornerX,cornerY);
        corner(-cornerX,-cornerY);
        corner(cornerX,cornerY);
        corner(cornerX,-cornerY);
        corner(tipX,tipY);
    }
}

module corner(x,y){
    translate([x,y,0]){
        circle(r=10);
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



