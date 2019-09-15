import processing.pdf.*;

String title = "matthias-jaeger.net.line-flow.pdf";
PGraphics pdf = createGraphics(3602, 3602, PDF, title);
PVector[] points = new PVector[60];

for (int i = 0; i < points.length; i++) {
  float spacing = pdf.width/points.length + 1;
  points[i] = new PVector(i * spacing, 0);
}

pdf.beginDraw();
for (int i = 0; i < pdf.height; i++) {
  pdf.beginShape();
  for (PVector p : points) {
    pdf.vertex(p.x, p.y);
    float flow_x = random(-8.0f, 8.0f);
    float flow_y = random(0.0f, 19.0f);
    p.add(new PVector(flow_x, flow_y));
  }
  pdf.endShape();
}
pdf.endDraw();
pdf.dispose();
exit();
