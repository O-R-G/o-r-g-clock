// a new primer timer
// july 13-15, 2018
// Public Private Secret master
// O-R-G

// on mac mini, requires a sound input source plugged in to run
// b/c Sound library looks for equal channels in and out

import processing.sound.*;

SoundFile ding, dang, dong;
PFont sftext;
// file, length seconds, line1, line2, line3, line4, line5
String[][] meta = {
  {"tetracono-1.mov", "123", "Tetracono", "macOS Screensaver", "", "Designed by Bruno Munari", "Published by http://www.o-r-g.com"},
  {"tetracono-2.mov", "100", "Tetracono", "macOS Screensaver", "", "Designed by Bruno Munari", "Published by http://www.o-r-g.com"},
  {"tetracono-3.mov", "97", "Tetracono", "macOS Screensaver", "", "Designed by Bruno Munari", "Published by http://www.o-r-g.com"},
  {"spiral-induction.mov", "90", "Spiral Induction", "macOS Screensaver", "", "Designed by Tauba Auerbach", "Published by http://www.o-r-g.com"},
  {"spiral-induction.mov", "90", "Spiral Induction", "macOS Screensaver", "", "Designed by Tauba Auerbach", "Published by http://www.o-r-g.com"},
  {"spiral-induction.mov", "90", "Spiral Induction", "macOS Screensaver", "", "Designed by Tauba Auerbach", "Published by http://www.o-r-g.com"},
  {"three-minutes.mov", "88", "Three Minutes of Doing Nothing", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"three-minutes.mov", "88", "Three Minutes of Doing Nothing", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"three-minutes.mov", "88", "Three Minutes of Doing Nothing", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"after-his-beautiful-1.mov", "54", "After His Beautiful Machine of 1855", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"after-his-beautiful-2.mov", "65", "After His Beautiful Machine of 1855", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"after-his-beautiful-3.mov", "66", "After His Beautiful Machine of 1855", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"breaking-like-surf.mov", "96", "Breaking Like Surf on a Shore Until", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"breaking-like-surf.mov", "96", "Breaking Like Surf on a Shore Until", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"breaking-like-surf.mov", "96", "Breaking Like Surf on a Shore Until", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"collapsing-two-1.mov", "78", "The Result of Collapsing Two Simultaneous Views", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"collapsing-two-1.mov", "78", "The Result of Collapsing Two Simultaneous Views", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"collapsing-two-2.mov", "73", "The Result of Collapsing Two Simultaneous Views", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"al-gore-1.mov", "91", "Al Gore Woke Up One Morning Wondering", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"al-gore-2.mov", "110", "Al Gore Woke Up One Morning Wondering", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"al-gore-3.mov", "110", "Al Gore Woke Up One Morning Wondering", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"something-left-to-save.mov", "83", "Perhaps There is Something Left to Save", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"something-left-to-save.mov", "83", "Perhaps There is Something Left to Save", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"something-left-to-save.mov", "83", "Perhaps There is Something Left to Save", "macOS Screensaver", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"multi.mov", "79", "Multi", "iOS App", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"multi.mov", "79", "Multi", "iOS App", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"multi.mov", "79", "Multi", "iOS App", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"wyoscan.mov", "110", "Wyoscan", "iOS App", "", "Designed by Dexter Sinister", "Published by http://www.o-r-g.com"},
  {"wyoscan.mov", "110", "Wyoscan", "iOS App", "", "Designed by Dexter Sinister", "Published by http://www.o-r-g.com"},
  {"wyoscan.mov", "110", "Wyoscan", "iOS App", "", "Designed by Dexter Sinister", "Published by http://www.o-r-g.com"},
  {"jules-1.mov", "90", "Jules", "iOS App", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"jules-2.mov", "82", "Jules", "iOS App", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
  {"jules-3.mov", "99", "Jules", "iOS App", "", "Designed by David Reinfurt", "Published by http://www.o-r-g.com"},
};

String[][] metaKM = {
  {"km-11.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-12.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-13.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-14.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-15.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-16.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-17.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-18.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-19.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-20.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"},
  {"km-21.mov", "60", "Three Times (in Blue and Yellow)", "macOS Screensaver", "", "Designed by Karel Martens", "Published by http://www.o-r-g.com"}
};

String[][] metaPrimer = {
   {"dots.mov", "92", "A *New* Primer of Visual Literacy", "Book", "", "Published by Inventory Press, Fall 2019", "http://www.a-new-primer-of-visual-literacy.org"}
};

int x, y;
int h, m, s;
int hl, ml, sl;
int lasthour;
int lastmin;
int lastsec;
int delta, gamma;
int speed;
int radius;

boolean normal = true;
boolean verbose = true;

int millis_start = 0;
int movieDuration = 0;

int millis_trailer_start = 0;
int trailerDuration = 10;

String[] currentMeta;
int movieIdx = 0;

void setup() {
  size(960, 960); // [960, 960]
  //size(480, 480);
  frameRate(60);
  noCursor();

  stroke(0);
  smooth();

  x = width / 2;
  y = width / 2;
  radius = int(width * .40);

  hl = (int)(radius * 0.50);
  ml = (int)(radius * 0.80);
  sl = (int)(radius * 0.90);
  h = 0;
  m = 0;
  s = 0;

  speed = 5;
  delta = -(int)(3600 / (frameRate * speed));
  gamma = 0;

  ding = new SoundFile(this, "ding-44k.aif");
  dang = new SoundFile(this, "ding-44k.aif");
  dong = new SoundFile(this, "ding-44k.aif");
  dang.rate(.25);
  dong.rate(.125);

  lasthour = hour();
  lastmin = minute();
  lastsec = second();

  sftext = createFont("fonts/sf-text-regular.ttf", 24);
  textFont(sftext);

}

void draw() {
  background(0);
  noFill();
  stroke(255);

  float ha, ma, sa;

  if (normal) {
    h = hour();
    m = minute();
    s = second();
    lasthour = checkHour(h, lasthour);
    lastmin = checkMin(m, lastmin);
    lastsec = checkSec(s, lastsec);

    ha = map(h % 12 + ((float) m) / 60.0, 0, 12, 0, TWO_PI) - HALF_PI;
    ma = map(m + ((float) s) / 60.0, 0, 60, 0, TWO_PI) - HALF_PI;
    sa = map(s, 0, 60, 0, TWO_PI) - HALF_PI;

    noFill();
    strokeWeight(3);
    ellipse(x, y, radius*2, radius*2);
    strokeWeight(3);
    line(x, x, cos(sa) * sl + x, sin(sa) * sl + y);
    strokeWeight(5);
    line(x, x, cos(ma) * ml + x, sin(ma) * ml + y);
    strokeWeight(5);
    line(x, x, cos(ha) * hl + x, sin(ha) * hl + y);
  } else {
    if (millis_start + movieDuration*1000 > millis()) {
      millis_trailer_start = millis();
    } else if (millis_trailer_start + trailerDuration*1000 > millis()) {
      fill(255, 255, 255);
      noStroke();
      textAlign(LEFT, TOP);

      int lineHeight = 30;
      int base = 20;
      for (int i = 2; i <= 6; i++) {
        text(currentMeta[i], base, base+lineHeight*(i-2));
      }
    } else {
      normal = true;
    }
  }
}

void playMovie(String[][] metaArray, int metaIdx) {
  if (millis_start + movieDuration*1000 < millis()) {
    currentMeta = metaArray[metaIdx%metaArray.length];
    normal = false;

    movieDuration = Integer.parseInt(currentMeta[1]);
    millis_start = millis();

    String path = dataPath(currentMeta[0]);
    //exec("/usr/bin/omxplayer", path, "-b", "--aspect-mode", "stretch");
    //exec("/usr/bin/lxterminal", "-e", "omxplayer", path, "-b", "--aspect-mode", "stretch");
    exec("/usr/bin/xterm","-fg","black","-bg","black","-fullscreen","-maximized","-e","omxplayer", path, "-b", "--aspect-mode", "stretch");
  }
}

// animation

// timers

int checkHour(int thish, int thislasthour) {
  if (thish != thislasthour) {
    switch (thish) {
    case 11:
      playMovie(metaKM, 0);
      thislasthour = thish;
      break;
    case 0:
    case 12:
      dong.play();
      playMovie(metaKM, 1);
      thislasthour = thish;
      break;
    case 13:
      playMovie(metaKM, 2);
      thislasthour = thish;
      break;
    case 14:
      playMovie(metaKM, 3);
      thislasthour = thish;
      break;
    case 15:
      playMovie(metaKM, 4);
      thislasthour = thish;
      break;
    case 16:
      playMovie(metaKM, 5);
      thislasthour = thish;
      break;
    case 17:
      playMovie(metaKM, 6);
      thislasthour = thish;
      break;
    case 18:
      playMovie(metaKM, 7);
      thislasthour = thish;
      break;
    case 19:
      playMovie(metaKM, 8);
      thislasthour = thish;
      break;
    case 20:
      playMovie(metaKM, 9);
      thislasthour = thish;
      break;
    case 21:
      playMovie(metaKM, 10);
      thislasthour = thish;
      break;
    default:
      thislasthour = thish-1;
      break;
    }
  }
  return thislasthour;
}

int checkMin(int thism, int thislastmin) {
  if (thism != thislastmin) {
    switch (thism) {
      // ding only at :00
    case 0:
      ding.play();
      thislastmin = thism;
      break;
    case 10:
    case 20:
    case 30:
    case 40:
    case 50:
      playMovie(meta, (int)random(meta.length));
      thislastmin = thism;
      break;
    default:
      thislastmin = thism-1;
      break;
    }
  }
  return thislastmin;
}

int checkSec(int thiss, int thislastsec) {
  if (thiss != thislastsec) {
    thislastsec = thiss - 1;
    switch (thiss) {
    case 0:
      break;
    default:
      break;
    }
  }
  return thislastsec;
}


// utility
void mousePressed() {
  //playMovie(meta, movieIdx);
  //movieIdx += 3;
}

void keyPressed() {
  int randomOffset = (int)random(3);
  switch(key) {
   case '`':
     playMovie(meta, 0+randomOffset); // Tetracono
     break;
  case '1':
     playMovie(meta, 3+randomOffset); // Spiral Induction
    break;
  case '2':
    playMovie(metaKM, (int)random(metaKM.length)); // Three Times (in Blue and Yellow)
    break;
  case '3':
    playMovie(meta, 6+randomOffset); // Three Minutes of Doing Nothing
    break;
  case '4':
    playMovie(meta, 9+randomOffset); // After his beautiful machine
    break;
  case '5':
    playMovie(meta, 12+randomOffset); // Breaking like surf on a shore until
    break;
  case '6':
    playMovie(meta, 15+randomOffset); // The Result of Collapsing Two Simultaneous Views
    break;
  case '7':
    playMovie(meta, 18+randomOffset); // Al Gore woke up one morning wondering..
    break;
  case '8':
    playMovie(meta, 21+randomOffset); // Perhaps there is something left to save
    break;
  case '9':
    playMovie(meta, 24+randomOffset); // Multi
    break;
  case '0':
    playMovie(meta, 27+randomOffset); // Wyoscan
    break;
  case '-':
    playMovie(meta, 30+randomOffset); //Jules
    break;
  case '=':
    playMovie(metaPrimer, 0); // Primer
    break;
  case 'd':
    ding.play();
    break;
  case 's':
    dang.play();
    break;
  case 'a':
    dong.play();
    break;
  case ' ':
    dong.play();
    playMovie(meta, (int)random(meta.length));
    break;
  case 'p':
    millis_start = millis()-movieDuration*1000;
    millis_trailer_start = millis()-trailerDuration*1000;
    break;
  default:
    break;
  }
}
