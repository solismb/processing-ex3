// ライブラリ読み込み(C 言語の#include と同じ) 
import JMyron.*; // カメラを取り扱う機能を追加 

// 大域変数 
JMyron m; // カメラを表す変数 
PImage img; // カメラから得た画像を表示するための変数 
float Rt = 255, Gt = 0, Bt = 0;

// 初期設定 
void setup(){ 
  size(640, 480, P3D); 
  frameRate(30); 
  m = new JMyron(); // カメラを扱う準備 
  m.start(width, height); // 映像の取り込み開始 
  m.findGlobs(0); // 取り込み速度を高速化 
  img = createImage(width, height, RGB); // 表示用の画像を用意 
} 

// 撮影が終わったときの終了処理 
public void stop(){ 
  m.stop(); 
  super.stop(); 
}

void mousePressed() {
  loadPixels();
  int i = mouseY * width + mouseX;
  Rt = red(pixels[i]);
  Gt = green(pixels[i]);
  Bt = blue(pixels[i]);
}

// メインルーチン 
void draw(){ 
  float xmin = img.width, xmax = 0, ymin = img.height, ymax = 0, T = 150;

  background(255); 
  m.update(); // カメラの最新映像を取り込む 
  m.imageCopy(img.pixels); // カメラの映像を img にコピーする 

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      float diff = sqrt(sq(Rt - red(img.pixels[y * img.width + x])) + sq(Gt - green(img.pixels[y * img.width + x])) + sq(Bt - blue(img.pixels[y * img.width + x])));
      if (diff <= 10) {
        if (x < xmin) xmin = x;
        if (x > xmax) xmax = x;
        if (y < ymin) ymin = y;
        if (y > ymax) ymax = y;
      }
    }
  }
  image(img, 0, 0);
  strokeWeight(3);
  stroke(255, 255, 0);
  rect(xmin, ymin, xmax - xmin, ymax - ymin);
  noFill();
  
} 

