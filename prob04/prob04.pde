// ライブラリ読み込み(C 言語の#include と同じ) 
import JMyron.*; // カメラを取り扱う機能を追加 
 
// 大域変数 
JMyron m; // カメラを表す変数 
PImage img; // カメラから得た画像を表示するための変数 
PImage outImg;
PImage outImg2;
PImage outImg3;
 
// 初期設定 
void setup(){ 
 size(800, 600, P3D); 
 frameRate(30); 
 m = new JMyron(); // カメラを扱う準備 
 m.start(320, 240); // 映像の取り込み開始 
 m.findGlobs(0); // 取り込み速度を高速化 
 img = createImage(320, 240, RGB); // 表示用の画像を用意 
 textFont(createFont("Century", 30));
 textAlign(LEFT, TOP);
} 
 
// 撮影が終わったときの終了処理 
public void stop(){ 
 m.stop(); 
 super.stop(); 
} 
 
// メインルーチン 
void draw(){ 
 background(0); 
 m.update(); // カメラの最新映像を取り込む 
 m.imageCopy(img.pixels); // カメラの映像を img にコピーする 
 
 outImg = createImage(320, 240, RGB);
 outImg2 = createImage(320, 240, RGB);
 outImg3 = createImage(320, 240, RGB);
 
 for (int y = 0; y < 240; y++) {
   for (int x = 0; x < 320; x++) {
     int p1 = y * 320 + x;
     int p2 = y * 320 + (320 - 1 - x);
     int p3 = (240 - 1 - y) * 320 + x;
     int p4 = (240 - 1 - y) * 320 + (320 - 1 - x);
     outImg.pixels[p1] = img.pixels[p2];
     outImg2.pixels[p1] = img.pixels[p3];
     outImg3.pixels[p1] = img.pixels[p4];
   }
 }
 
 // 以降は静止画同様に img を扱える 
 text("Original", 0, 0);
 image(img, 0, 30);
 
 text("Flip Horizontally", 360, 0);
 image(outImg, 350, 30);
 
 text("Flip Vertically", 0, 280);
 image(outImg2, 0, 310);
 
 text("Flip H + V", 360, 280);
 image(outImg3, 360, 320);
}
