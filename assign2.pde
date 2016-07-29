PImage fighterImg, enemyImg, hpImg, treasureImg ;
PImage bg1Img, bg2Img, start1Img, start2Img, end2Img ;

float x = 38.6 ;

int y = floor(random(10,590)) ;
int z = floor(random(45,425)) ;
int q = floor(random(45,425)) ;
int w = 0, h = 0, m = -640, a = 575, b = 220 ;
int gameState;

final int GAME_START = 1 ;
final int GAME_RUN = 2 ;
final int GAME_LOSE = 3 ;

boolean upPressed, downPressed, leftPressed, rightPressed ;

void setup(){
  size(640,480) ;
  fighterImg = loadImage("img/fighter.png") ;
  enemyImg = loadImage("img/enemy.png") ;
  hpImg = loadImage("img/hp.png") ;
  treasureImg = loadImage("img/treasure.png") ;
  bg1Img = loadImage("img/bg1.png") ;
  bg2Img = loadImage("img/bg2.png") ;
  start1Img = loadImage("img/start1.png") ;
  start2Img = loadImage("img/start2.png") ;
  end2Img = loadImage("img/end2.png") ;
  gameState = GAME_START ;
  upPressed = false  ;
  downPressed = false ;
  leftPressed = false ;
  rightPressed = false ;
}

void draw(){
  switch(gameState){
    case GAME_START :
      image (start2Img,0,0) ;
      if(mouseX>207 && mouseX<455 && mouseY>377 && mouseY<408){
        if(mousePressed) {gameState=GAME_RUN ;} image (start1Img,0,0) ;}
      break ; 
      
    case GAME_RUN :
      //background
      image (bg1Img,h,0) ;
      image (bg2Img,m,0) ;
      h+= 2 ;m+= 2 ;
      if(h==640) {h = -640 ;}
      if(m==640) {m = -640 ;}
                        
      //hp
      fill (255,0,0) ;
      rect (10,9,x,25) ;
      image (hpImg,2,5) ;
      if(x>=198){x=198;}
                        
      //fighter
      image (fighterImg,a,b) ;
      if(upPressed) {b-= 3 ;}
      if(downPressed) {b+= 3 ;}
      if(leftPressed) {a-= 3 ;}
      if(rightPressed) {a+= 3 ;}
      if(a > 575) {a = 575 ;}
      if(a < 15) {a = 15 ;}
      if(b > 425) {b = 425 ;}
      if(b < 15) {b = 15 ;}
                        
      //enemy
      image (enemyImg,w%640,z) ;
      w+= 4 ;
      while((a<=(w%640)+50 && a>=(w%640)) 
        &&(b>=z && b<=z+50 || b+50>=z && b+50<=z+50))
        {x-= 38.6 ; w=0 ;
         z = floor(random(45,425)) ; image (enemyImg,w%640,z) ;}
       
      //treasure          
      image (treasureImg,y,q) ;
      while((a<=y+40 && a>=y || a+50<=y+40 && a+50>=y) 
        && (b>=q && b<=q+40 || b+50>=q && b+50<=q+40))
        {x+= 19.3 ; y = floor(random(10,590)) ;
         q = floor(random(45,425)) ; image (treasureImg,y,q) ;}
     
      
      //lose
      if(x<=0){gameState = GAME_LOSE ;}
      break ;
      
    case GAME_LOSE:
      gameState = GAME_LOSE;
      image (end2Img,0,0) ;
      break ;
  }}

void keyPressed(){
  if(key == CODED){switch( keyCode ){
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
    }}}
    
void keyReleased(){
  if(key == CODED){switch( keyCode ){
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
    }}}
