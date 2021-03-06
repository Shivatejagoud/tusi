//GLOBALS
int w = 800;
float r = (w * .9) / 2;
float small_r = 0.03 * r;
int frame_count = 0;
float period = 180;
int num_circles = 8;
float degree_step = 180.0 / num_circles;

void setup() {
  frameRate(60);
  size(800, 800);
  smooth();
}

void draw() {
  translate(w/2,w/2);
  frame_count++;
  background(255);
  drawBaseCircle();
  drawLines();
  drawInnerCircles();
}

void drawBaseCircle() {
  fill(0);
  stroke(0);
  ellipse(0, 0, r * 2, r * 2);
}

void drawLines() {
  stroke(200);
  for (float i = 0; i <= 360; i+=(degree_step)) {
    float x = cos(radians(i)) * r;
    float y = sin(radians(i)) * r;
    line(0, 0, x, y);
  }
}

void drawInnerCircles() {
  fill(255);
  stroke(255);
  int j = 0;
  for (float i = 0; i < 180; i+=(degree_step)) {
    float rad = (r * .97) * cos((TWO_PI / period * frame_count) + ((j * PI) / 8 ));
    ellipse(rad * cos(radians(i)), rad * sin(radians(i)), w * .03, w * .03);
    j++;
  }
}
