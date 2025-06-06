import graph;

// Custom functions
void drawshifted(path g, pair trueshift, picture pic=currentpicture, 
                 Label label="", pen pen=currentpen, arrowbar arrow=None,
				 arrowbar bar=None, margin margin=NoMargin, 
				 marker marker=nomarker){
  pic.add(new void(frame f, transform t) {
    picture opic;
    draw(opic, L=label, shift(trueshift)*t*g, p=pen, arrow=arrow, bar=bar, margin=margin, marker=marker);
    add(f,opic.fit());
  });
  pic.addBox(min(g), max(g), trueshift+min(pen),  trueshift+max(pen));
}

// Setup
settings.outformat = "pdf";
size(10cm);
//unitsize(4cm);
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
real barheight = f(x+dx);
pair barshifty = (0, 0.2cm);
Label dxlabel = Label("$dx$", position=MidPoint, align=2N);
path dx_line = (x, barheight) -- (x+dx, barheight);
//draw(dx_line, L=dxlabel, bar=Bars);
drawshifted(dx_line, trueshift=barshifty, label=dxlabel, bar=Bars);

real arrowlength = 0.3cm;
margin arrowmargin = DotMargin;
path leftarrow  = shift(barshifty) * ( (-arrowlength, 0) -- (0,0) );
path rightarrow = shift(barshifty) * ( ( arrowlength, 0) -- (0,0) );
//arrow((x, barheight), W, length=arrowlength, margin=arrowmargin);
//arrow((x+dx, barheight), E, length=arrowlength, margin=arrowmargin);
draw((x, barheight), leftarrow, arrow=Arrow(), margin=arrowmargin);
draw((x+dx, barheight), rightarrow, arrow=Arrow(), margin=arrowmargin);


// f(x) bar
real barx = x + dx;
pair barshiftx = (0.42cm, 0);
Label fxlabel = Label("$f(x)$", position=MidPoint, align=(0,0), filltype=Fill(fillpen));
path fx_line = (barx,0) -- (barx, f(x));
//draw(fx_line, arrow=Arrows(), bar=Bars, L=fxlabel);
//drawshifted(fx_line, trueshift=barshiftx,arrow=Arrows(), bar=Bars, L=fxlabel);

drawshifted(fx_line, trueshift=barshiftx, label=fxlabel, arrow=Arrows(), bar=Bars);

// Labels
Label Lx = Label("$x$", position=EndPoint);
Label Ly = Label("$y$", position=EndPoint);
// label("$x$", (xmax,0), align=E);
// label("$y$", (0,ymax), align=N);

// Cartesian Plane
arrowbar axisarrow = Arrow(TeXHead);
path xaxis = (xmin, 0.0) -- (xmax, 0.0);
path yaxis = (0.0, ymin) -- (0.0, ymax);
path tick = (0,0) -- (0, -0.15cm);
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
