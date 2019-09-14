import processing.pdf.*;

String TITLE = "matthias-jaeger.net.line-flow.pdf";
PGraphics pdf = createGraphics(3602, 3602, PDF, TITLE);
PVector[] points = new PVector[200]; // "folds"
final float shifts = 3.0f;           // "overlap"  
final float drops = 13.0f;           // "density" 

pdf.beginDraw();
pdf.background(color(#FFFFFF));
pdf.stroke(color(#000000));
pdf.strokeWeight(4.0f);

for (int i = 0; i < points.length; i++) {
  points[i] = new PVector(i * (pdf.width/points.length), 0);
}

for (int i = 0; i < pdf.height + 100; i++) {
  pdf.beginShape();
  for (PVector p : points) {
    pdf.vertex(p.x, p.y);
    float shift_x = random(-shifts, shifts);
    float drops_y = random(0.0f, drops);
    p.add(new PVector(shift_x, drops_y));
  }
  pdf.endShape();
}
pdf.dispose();
pdf.endDraw();
exit();
