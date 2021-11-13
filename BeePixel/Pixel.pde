class Pixel{
  float x;
  float y;
  float pixelSize;
  color clr;
  int delayFrames;
  int opacity;
  
  Pixel(float x, float y, float pixelSize,color clr) {
    this.x = x;
    this.y = y;
    this.pixelSize = pixelSize;
    this.clr = clr;
    this.opacity = 0;
  }
  
  void drawBeePixel(float x, float y, float l) {
    pushMatrix();
    translate(x, y);
    beginShape();
    vertex(0,-l);
    vertex(l/2,-l/2);
    vertex(l/2,l/2);
    vertex(0,l);
    vertex(-l/2,l/2);
    vertex(-l/2,-l/2);
    vertex(0,-l);
    endShape();
    popMatrix();
  }
  
  void drawPixel() {
    if(delayFrames<=0) {
      opacity++;
      if(opacity>255){
        opacity = 255;
        if(random(0,500)<1){
          opacity = (int)random(100,255);
        }
      }
      
      fill(clr,opacity);
      drawBeePixel(x, y, pixelSize);
    }else{
      delayFrames--;
    }
    
  }

}
