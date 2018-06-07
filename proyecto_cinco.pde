import processing.video.*;

Movie video;
int v=0;
PImage p1,p2,fondo;

void setup()
{
  size (640,360);
  
  p1=loadImage ("pantallaUno.jpg");
  p2=loadImage ("pantallaDos.jpg");
  fondo=loadImage ("fondo.png");
  video = new Movie (this,"video.mp4");
  
}

void draw()
{
  if (v==0)
  {
    image (p1,0,0,width,height);
    
    noFill();
    stroke(0);
    rect (175,270,100,50);
    
    if (mousePressed && (mouseX>=175) && (mouseX<=175+100) && (mouseY>=270) && (mouseY<=270+50))
    {
      v=1;
      println (v);
    }
  }
  
  if (v==1)
  {
        image (p2,0,0,width,height);
        
        if (mousePressed && (mouseX>=175) && (mouseX<=175+100) && (mouseY>=200) && (mouseY<=200+50))
    {
      v=2;
      println (v);
    }
  }
  
  if (v==2)
  {
    image (video,0,0,width,height);
    video.loop();
    image (fondo,0,0,width,height);
    keyPressed();  
  }
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed()
{
  switch (key)
  {
   
    case 'b':
    video.filter (GRAY);
    break;
    
    case 'a':   
    tint (#3B83BD,50);
    break;
    
    case 's':
    tint (150, 100, 49, 50);
    break;
    
    case 'z':
    noTint();
    video.filter (NORMAL);
    break;
    
    case 'e':
    exit();
    break;
  }
}