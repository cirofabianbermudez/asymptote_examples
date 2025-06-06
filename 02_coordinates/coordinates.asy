settings.outformat = "pdf";

//unitsize(1cm);
size(3cm);

// Cartesian Plane
draw( (-2.0, 0.0) -- (2,0), arrow = Arrow(TeXHead));
draw( ( 0.0,-2.0) -- (0,2), arrow = Arrow(TeXHead));

// Plot
//draw( (0,0) -- (1,1) -- (2, sqrt(2)) );

//draw( (0,0) .. (1,1) .. (2, sqrt(2)), red);


//draw( (0,0){up} .. (1,1) .. (2, sqrt(2)), green );

//draw( (0,0){(1,1)} .. {right}(pi/2,1) .. {(1,-1)}(pi,0) .. {right}(3*pi/2,-1) .. {(1,1)}(2*pi, 0), blue);
//draw((0,0) .. (pi/2,1) .. (pi,0) .. (3*pi/2,-1) .. (2*pi, 0), cyan);

//draw((0,2) .. {(1,-3)}(2,0){(1,1/3)} .. (4,2));

//draw( (2,0) -- (3,-3));

//draw((0,0) .. (pi/2,1) .. (pi,0) .. (3*pi/2,-1) .. (2*pi, 0), marker=MarkFill[0]);

draw(circle((0,0), 1));

draw( shift(0.5, sqrt(1 - 0.5*0.5)) *circle( (0,0), 0.3), red);

draw(ellipse((0,0), 1, 0.4), green);

path p = box((0,0), (2,2));

draw(shift(-1,-1)*rotate(45, (1,1))*p);