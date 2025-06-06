import graph;

// Custom functions
void drawshifted(path g, pair trueshift, picture pic=currentpicture, Label label="", 
                pen pen=currentpen, arrowbar arrow=None, arrowbar bar=None, 
                margin margin=NoMargin, marker marker=nomarker) {
  pic.add(new void(frame f, transform t){
    picture opic;
    draw(opic, L=Label, shift(trueshift)*t*g, p=pen, arrow=arrow, bar=bar, margin);
    add(f, opic.fit());
  });
  pic.addBox(min(g), max(g), trueshift+min(pen), trueshift+max(pen));
}

// Setup
settings.outformat = "pdf";
size(5cm);
unitsize(4cm);
defaultpen(fontsize(10pt));

// Global variables
real xmin = -0.1; real xmax =  2.0;
real ymin = -0.1; real ymax =  2.0;
real f(real x) {return sqrt(x); }

// Plot
path s = graph(f, 0, 2, operator ..);
pen fillpen = mediumgray;
fill(s -- (xmax,0) -- cycle, fillpen);
Label fx = Label("$y=f(x)$", position=EndPoint);
draw(s, L=fx);

// Strip
real x = 1.4; real dx = 0.05;
real t0 = times(s, x)[0];
real t1 = times(s, x+dx)[0];
path striptop = subpath(s, t0, t1);
filldraw( (x,0) -- striptop -- (x+dx, 0) -- cycle, black);

// dx line
real lineheight = f(x)*1.08;
Label dx_label = Label("$dx$", position=MidPoint, align=2N);
path dx_line = (x, lineheight) -- (x+dx, lineheight);
draw(dx_line, L=dx_label, bar=Bars);
real arrowlength = 0.3cm;
margin arrowmargin = DotMargin;
arrow((x, lineheight), W, length=arrowlength, margin=arrowmargin);
arrow((x+dx, lineheight), E, length=arrowlength, margin=arrowmargin);

// f(x) bar
real bar_x = (x+dx)*1.07;
Label Lh = Label("$f(x)$", position=MidPoint, align=(0,0), filltype=Fill(fillpen));
path fx_line = (bar_x,0) -- (bar_x, f(x));
draw(fx_line, arrow=Arrows(), bar=Bars, L=Lh);

// Labels
Label Lx = Label("$x$", position=EndPoint);
Label Ly = Label("$y$", position=EndPoint);
// label("$x$", (xmax,0), align=E);
// label("$y$", (0,ymax), align=N);

// Cartesian Plane
arrowbar axisarrow = Arrow(TeXHead);
path xaxis = (xmin, 0.0) -- (xmax, 0.0);
path yaxis = (0.0, ymin) -- (0.0, ymax);
draw(xaxis, arrow = axisarrow, L=Lx);
draw(yaxis, arrow = axisarrow, L=Ly);

// Tick
path tick = (0,0) -- (0, -0.15cm);
Label ticklabel = Label("$x$", position=EndPoint);
draw((x,0), tick, L=ticklabel);

//path clippath = circle( (x,0), 0.2);
//draw(clippath, blue);
//clip(clippath);



//draw( (x,0) -- (x, sqrt(x)) -- (x+dx, sqrt(x+dx)) -- (x+dx, 0) -- cycle, blue);
//path g = graph(sqrt, 0, 2, operator ..);
//path g = graph(sqrt, 0, 2, n=100, Hermite);
//path g = graph(sqrt, 0, 2, operator ..);
//draw(g, green);

//clip(box((1,ymin),(1.6,1.5)));
//path e = shift((1.4,0.7))*rotate(90)*ellipse( (0,0), 1, 0.3 );
//draw(e, black);
//clip(e);
