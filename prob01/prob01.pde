// 大域変数
PImage img;  // 画像ファイルを扱う変数を作る

// 初期設定
void setup() {
  size(640, 480, P3D);
  frameRate(30);
  img = loadImage("test.png");  // 「test.png」という画像ファイルを読み込む
}

// メインルーチン
void draw() {
  background(160, 255, 255);  // 背景を水色にする
  image(img, mouseX, mouseY);
}

void keyPressed() {
  if (key == '1') {
    img = loadImage("test.png");
  } else if(key == '2') {
    img = loadImage("hoge.png");
  }
}
