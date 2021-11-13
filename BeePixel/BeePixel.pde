PImage image;
float len = 10;
ArrayList<Pixel> pixels;

void setup() {
  size(680, 980);
  noStroke();
  image = loadImage("mario.png");
  image.loadPixels();
  pixels =new ArrayList<Pixel>();
  float baseY = 0;  
  for (int r=0;r<image.height;r++) {
    float baseX = 0;
    if(r%2==0){
      baseX = 0.5*len;
    }
    for(int c = 0;c<image.width;c++) {
      int index = r* image.width+c;
      color clr = image.pixels[index];
      float x = baseX + c*len;
      float y = baseY;
      Pixel pixel = new Pixel(x, y, len, clr);
      pixel.delayFrames = (int)random(0,300);
      pixels.add(pixel);
    }
    baseY+=1.5*len;
  }
  
}

void draw() {
  background(255);
  for(Pixel pixel: pixels) {
    pixel.drawPixel();
  }

}
