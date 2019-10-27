import processing.pdf.*;

String title = "matthias-jaeger.net.line-flow.pdf";
PGraphics pdf = createGraphics(3602, 3602, PDF, title);

int density = 80;
float shift = 7.0;
float drops = 11.0;

PVector[] points = new PVector[density];

for (int i = 0; i < points.length; i++) {
  float scl = pdf.width/points.length;
  points[i] = new PVector(i * scl, 0);
}

pdf.beginDraw();
for (int i = 0; i < pdf.height; i++) {
  pdf.beginShape();
  for (PVector p : points) {
    pdf.vertex(p.x, p.y);
    float shift_x = random(-shift, shift);
    float drops_y = random(0, drops);
    p.add(new PVector(shift_x, drops_y));
  }
  pdf.endShape();
}
pdf.endDraw();
pdf.dispose();
exit();
