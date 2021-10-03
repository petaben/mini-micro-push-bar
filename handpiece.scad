$fn=50;

difference(){
    handPiece();
    hole();
}

module hole(){
    translate([0,0,-20]){
        cylinder(60,11.5,11.5);
    }
}

module handPiece(){
    cylinder(35,15,15);
    for (i = [0 : 45 : 360]){
        rotate([0,0,i]){
            slice();
        }
    }
    sphere(25);
}

module slice(){
    intersection(){
        cube([5,60,60], center=true);
        sphere(26.5);
    }
}