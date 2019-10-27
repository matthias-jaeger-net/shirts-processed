/**
 * C program to find maximum and minimum element in array
 */
 
 import processing.pdf.*;

String title = "matthias-jaeger.net.line_scape.pdf";
PGraphics pdf = createGraphics(3600, 3600, PDF, title);

PVector[] points = new PVector[90];
for (int i = 0; i < points.length; i++) {
  float x = i * pdf.width/points.length * 1.5;
  points[i] = new PVector(x, 0);
}

pdf.beginDraw();
for (int i = 0; i < height; i++) {
  pdf.beginShape();
  for (PVector p : points) {
    pdf.vertex(p.x, p.y);
    float x = random(-10.0, 10.0);
    float y = random(0, 29.0);
    p.add(new PVector(x, y));
  }
  pdf.endShape();
}
pdf.endDraw();
pdf.dispose();
exit();
