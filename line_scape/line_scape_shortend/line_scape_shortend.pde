import processing.pdf.*;

String title = "matthias-jaeger.net.line_scape.pdf";
PGraphics pdf = createGraphics(3600, 3600, PDF, title);
PVector[] points = new PVector[70];

for (int i = 0; i < points.length; i++)
  points[i] = new PVector(i * pdf.width/points.length * 1.5, 0);

pdf.beginDraw();

for (int i = 0; i < height * 29.0; i++) {
  
  pdf.beginShape();
    for (PVector p : points)    
      pdf.vertex(p.x, p.y);
  pdf.endShape();

  for (PVector p : points) {
    float x = random(-10.0, 10.0);
    float y = random(0, 29.0);
    p.add(new PVector(x, y));
  }
}

pdf.endDraw();
pdf.dispose();
exit();
