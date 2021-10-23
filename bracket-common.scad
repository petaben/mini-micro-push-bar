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

