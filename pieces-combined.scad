use <bracket-top.scad>
use <bracket-bottom.scad>
use <handpiece.scad>

translate([0,-47,120]){
    rotate([180+20,0,0]){
        handPiece();
    }
}

bracketTop();

translate([0,0,-20]){
    rotate([0,0,180]){
        bracketBottom();
    }
}