// 大域変数
PImage inImg;
PImage outImg;
PImage outImg2;
PImage outImg3;

void setup() {
  size(800, 600, P3D);
  frameRate(30);
  inImg = loadImage("nobol.jpg");
  textFont(createFont("Century", 30));
  textAlign(LEFT, TOP);
}

void draw() {
  background(0);
  
  outImg = createImage(inImg.width, inImg.height, RGB);
  outImg2 = createImage(inImg.width, inImg.height, RGB);
  outImg3 = createImage(inImg.width, inImg.height, RGB);
  
  for (int y = 0; y < inImg.height; y++) {
    for (int x = 0; x < inImg.width; x++) {
      int p1 = y * inImg.width + x;
      int p2 = y * inImg.width + (inImg.width - 1 - x);
      int p3 = (inImg.height - 1 - y) * inImg.width + x;
      int p4 = (inImg.height - 1 - y) * inImg.width + (inImg.width - 1 - x);
      outImg.pixels[p1] = inImg.pixels[p2];
      outImg2.pixels[p1] = inImg.pixels[p3];
      outImg3.pixels[p1] = inImg.pixels[p4];
    }
  }
  
  text("Original", 0, 0);
  image(inImg, 0, 30);
  
  text("Flip Horizontally", inImg.width + 30, 0);
  image(outImg, inImg.width + 30, 30);
  
  text("Flip Vertically", 0, inImg.height + 40);
  image(outImg2, 0, 30 + inImg.height + 50);
  
  text("Flip H + V", inImg.width + 30, inImg.height + 40);
  image(outImg3, inImg.width + 30, inImg.height + 80);
}
