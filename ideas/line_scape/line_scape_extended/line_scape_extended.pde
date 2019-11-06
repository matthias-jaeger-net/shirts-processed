import processing.pdf.*;
final String title = "matthias-jaeger.net.line_scape.pdf";
final PVector[] scape = new PVector[100];

void setup() {
  size(3600, 3600, PDF, title);
  
  for (int i = 0; i < scape.length; i++)
    scape[i] = new PVector(i * width / scape.length * 1.5, 0);
  
  int counter = 0;
  while (counter < scape.length) {
    float max = scape[0].y, min = scape[0].y, isOffScreen = 0.0;
    for (PVector v : scape) {
      if (v.y > max) max = v.y;
      if (v.y < min) min = v.y;
    }
    isOffScreen = height + (max - min);
    
    beginShape();
    for (PVector v : scape) {
      if (v.y > isOffScreen) counter++;
      vertex(v.x, v.y);
      v.add(new PVector(random(-10.0, 10.0), random(0, 29.0)));
    }
    endShape(); 
  }
  exit();
}
