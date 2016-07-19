import processing.video.*;
Movie myMovie;
int currentFrame=-1;
String fName;

void setup()
{
  size(420,280);
  selectInput("Select a file to play:","fileSelected");
  noLoop();
}

void fileSelected(File file)
{
  if(file==null)
  println("please select a file to proceed");
  else
  {
    println("selected file is "+file.getAbsolutePath());
    myMovie=new Movie(this,file.getAbsolutePath());
    myMovie.play();
  }
}

void draw()
{
  if(myMovie!=null)
  {
    image(myMovie,0,0,myMovie.width,map(myMovie.height,0,myMovie.width,0,width));
    noLoop();
    currentFrame++;
  }
}

void movieEvent(Movie m)
{
  m.read();
  fName="movie"+currentFrame+".jpg";
  loop();
  saveFrame(fName);
  noLoop();
}
