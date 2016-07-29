PImage treasureImg ;
PImage bg1Img ; 
PImage bg2Img ;
PImage start1Img ;
PImage start2Img ;
PImage end2Img ;
int x=floor(random(03,195)) ;
int y=floor(random(10,590)) ;
int z=floor(random(45,425)) ;
int q=floor(random(45,425)) ;
int w = 0 ;
int h = 0 ;
int m = -640 ;
int a = 575 ;
int b = 220 ;
int gameState;
final int GAME_START = 1 ;
final int GAME_RUN = 2 ;
final int GAME_LOSE = 3 ;
boolean upPressed ;
boolean downPressed ;
boolean leftPressed ;
boolean rightPressed ;


void setup(){
  size(640,480) ;
  fighterImg = loadImage("img/fighter.png") ;
  enemyImg = loadImage("img/enemy.png") ;
  hpImg = loadImage("img/hp.png") ;
  treasureImg = loadImage("img/treasure.png") ;
  bg1Img = loadImage("img/bg1.png") ;
  bg2Img = loadImage("img/bg2.png") ;
  start1Img = loadImage("img/start1.png");
  start2Img = loadImage("img/start2.png");
  end2Img = loadImage("img/end2.png");
  gameState = GAME_RUN;
  upPressed = false  ;
  downPressed = false ;
  leftPressed = false ;
  rightPressed = false ;
 }

void draw(){
switch(gameState){
case GAME_START:
image(start2Img,0,0);
if(mouseX>207 && mouseX<455 && mouseY>377 && mouseY<408){
if(mousePressed){gameState=GAME_RUN;}
image (start1Img,0,0);}
break; 
      
case GAME_RUN:
//background
image (bg1Img,h,0) ;
image (bg2Img,m,0) ;
h+= 2 ;m+= 2 ;
if (h==640) {h = -640 ; }
if (m==640) {m = -640 ; }
                  
//hp
fill (255,0,0) ;
rect (10,5,x,25) ;
image (hpImg,2,5) ;
                  
//fighter
image (fighterImg,a,b) ;
if(upPressed){b-=3;}
if(downPressed){b+=3;}
if(leftPressed){a-=3;}
if(rightPressed){a+=3;}
if(a>575){a=575;}
if(a<15){a=15;}
if(b>425){b=425;}
if(b<15){b=15;}
                  
//enemy
image (enemyImg,w%640,z) ;
w+=4 ;
 

//treasure          
image (treasureImg,y,q) ;

//lose
if((a<=(w%640)+50 && a>=(w%640))&& (b>=z && b<=z+50 || b+50>=z && b+50<=z+50))
{gameState=GAME_LOSE;}

break;

case GAME_LOSE:
image (end2Img,0,0) ;
break;


}
}


void keyPressed(){
  if(key == CODED){
    switch( keyCode ){
      case UP:
        upPressed = true  ;
        break;
      case DOWN:
        downPressed = true ;
        break;
      case LEFT:
        leftPressed = true  ;
        break;
      case RIGHT:
        rightPressed = true ;
        break;
    }
  }
}
void keyReleased(){
  if(key == CODED){
    switch( keyCode ){
      case UP:
        upPressed = false  ;
        break;
      case DOWN:
        downPressed = false ;
        break;
      case LEFT:
        leftPressed = false  ;
        break;
      case RIGHT:
        rightPressed = false ;
        break;
    }
  }
}
