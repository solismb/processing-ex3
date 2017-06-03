// 大域変数
PImage inImg;
PImage outImg;

void setup() {
  size(800, 600, P3D);
  frameRate(30);
  inImg = loadImage("mori.jpg");
  textFont(createFont("Century", 30));
  textAlign(LEFT, TOP);
}

void draw() {
  background(0);
  
  outImg = createImage(inImg.width, inImg.height, RGB);
  
  for (int y = 0; y < inImg.height; y++) {
    for (int x = 0; x < inImg.width; x++) {
      float r = red(inImg.pixels[y * inImg.width + x]);
      float g = green(inImg.pixels[y * inImg.width + x]);
      float b = blue(inImg.pixels[y * inImg.width + x]);
      outImg.pixels[y * inImg.width + x] = color(r, g/2, b);
      
    }
  }
  
  text("Original", 0, 0);
  image(inImg, 0, 30);
  
  text("Output", inImg.width + 30, 0);
  image(outImg, inImg.width + 30, 30);
}
  

