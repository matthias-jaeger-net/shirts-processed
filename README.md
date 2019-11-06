# shirts-processed
Designs for T-Shirts made with the Processing IDE

# shapeFlow 
![shapeFlow](shapeFlow-mockup.png)

## Data Downloads
- Final front side
- - https://github.com/matthias-jaeger-net/shirts-processed/raw/master/print/shapeFlow/matthias-jaeger-net--shapeFlow.pdf
- Final back side
- - https://github.com/matthias-jaeger-net/shirts-processed/raw/master/print/shapeFlow/matthias-jaeger-net--shapeFlow-code.pdf

## Printed code
```java
import processing.pdf.*;

String title = "matthias-jaeger-net--shapeFlow.pdf";
PGraphics pdf = createGraphics(3600, 3600, PDF, title);
PVector[] shape = new PVector[100];

for (int i = 0; i < shape.length; i++) {
  float x = i * (pdf.width / shape. length);
  shape[i] = new PVector(x, 0);
}

pdf.beginDraw();
pdf.fill(255, 255, 255);
pdf.stroke(0, 0, 0);
pdf.strokeWeight(8);

for (int i = 0; i < pdf.height; i++) {
  pdf.beginShape();
  for (PVector vector : shape) {
    pdf.vertex(vector.x, vector.y);
    float shift_x = random(-10, 10);
    float drops_y = random(0, 30);
    vector.add(new PVector(shift_x, drops_y));
  }
  pdf.endShape();
}

pdf.endDraw();
pdf.dispose();
exit();
```

## Commented version
```java
/** 
* shapeFlow.pde - commented
*/

// I'm using the pdf library in static mode, so no setup() or draw() is defined
import processing.pdf.*;

// Just to have the author on the shirt ;)
String title = "matthias-jaeger-net--shapeFlow.pdf";

// Create a graphics buffer with print resolution  
// using PDF render constant and the title from above
PGraphics pdf = createGraphics(3600, 3600, PDF, title);

// Consider a shape as an array of 100 vectors
PVector[] shape = new PVector[100];

// Initialize the shape on the top edge of the pdf 
for (int i = 0; i < shape.length; i++) {

  // Space out the points proportional to the width
  float x = i * (pdf.width / shape.length);

  // Add the points to the shape
  shape[i] = new PVector(x, 0);
}

// Start drawing the pdf
pdf.beginDraw();

// Set the fill color to white
pdf.fill(255, 255, 255);

// Set the stroke color to black 
pdf.stroke(0, 0, 0);

// Set the stroke weight for printing 
pdf.strokeWeight(8);

// Stack the shape 3600 times on top of each other 
for (int i = 0; i < pdf.height; i++) {
  
  // Start a fresh shape
  pdf.beginShape();
  
  // Loop over the shapes current vectors
  for (PVector vector : shape) {
    
    // Add the vector to the shape 
    pdf.vertex(vector.x, vector.y);
    
    // Create a random motion vector that's pointing downwards, mostly
    float shift_x = random(-10, 10);
    float drops_y = random(0, 30);
    
    // Then add the changes to the shape vector 
    vector.add(new PVector(shift_x, drops_y));
  }
  
  // Done with looping and close the shape
  pdf.endShape();
}

// Done with stacking shapes on top of each other
pdf.endDraw();

// Has to be called in static mode, closes the file
pdf.dispose();

// Done with all quit the program
exit();
```
