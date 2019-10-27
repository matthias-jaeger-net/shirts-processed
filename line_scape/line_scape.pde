import processing.pdf.*;

String title = "matthias-jaeger.net.line_scape.pdf";
PGraphics pdf = createGraphics(3600, 3600, PDF, title);
PVector[] points = new PVector[60];
for (int i = 0; i < points.length; i++) {
  float scaling = pdf.width / points.length;
  points[i] = new PVector(i * scaling * 1.5, 0);
}

pdf.beginDraw();
pdf.strokeWeight(2);
int viewCurrent = 0;
while (viewCurrent < points.length) {
  pdf.beginShape();
    for (PVector p : points)    
      pdf.vertex(p.x, p.y);
  pdf.endShape();

  float max = points[0].y, min = points[0].y;
  for (PVector p : points) {
    if (p.y > max) max = p.y;
    if (p.y < min) min = p.y;
  }
  float outOfView = pdf.height + (max - min);  

  for (PVector p : points) {
    if (p.y > outOfView) viewCurrent++;
    float x = random(-10.0, 10.0);
    float y = random(0, 9.0);
    p.add(new PVector(x, y));
  }
}
pdf.endDraw();
pdf.dispose();
exit();
