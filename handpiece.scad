$fn=50;

handPiece();

module handPiece(){
    difference(){
        handPieceShape();
        hole();
    }
}


module hole(){
    radius = 23 / 2;
    translate([0,0,-20]){
        cylinder(60, radius, radius);
    }
}

module handPieceShape(){
    cylinderRadius = 30 / 2;
    cylinder(35, cylinderRadius, cylinderRadius);
    for (i = [0 : 45 : 360]){
        rotate([0,0,i]){
            slice();
        }
    }
    sphere(r=25);
}

module slice(){
    intersection(){
        cube([5, 60, 60], center=true);
        sphere(r=26.5);
    }
}