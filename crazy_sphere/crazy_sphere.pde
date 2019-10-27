import processing.pdf.*;

String title = "matthias-jaeger.net.crazy_sphere.pdf";
PGraphics pdf = createGraphics(3600, 3600, PDF, title);
float angle = 0.0f;

PVector[] points = new PVector[10];
for (int i = 0; i < points.length; i++) 
{
  float radius = random(pdf.width * 0.1f, pdf.width * 0.4f);
  points[i] = PVector.random2D().mult(radius);
}

pdf.beginDraw();
pdf.background(color(#FFFFFF));
pdf.stroke(color(#000000));
pdf.fill(color(#FFFFFF));
pdf.translate(pdf.width * 0.5f, pdf.height * 0.5f);

while (angle < PI * 2) 
{
  pdf.rotate(angle);

  for (PVector point : points) 
  {
    pdf.pushMatrix();
    pdf.translate(point.x, point.y);
    float radius = angle * sin(point.y + point.x) * 10.0f;
    pdf.ellipse(0, 0, radius, radius);
    pdf.popMatrix();
    point.add(PVector.random2D());
  }

  angle = angle + 0.01f;
}

pdf.endDraw();
pdf.dispose();
exit();
