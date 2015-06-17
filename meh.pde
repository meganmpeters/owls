PFont f;
Table table;

int radius = 5;
int plotX1, plotY1;
int plotX2, plotY2;

void setup() {
  size(700,700);
  background(200);
  
  plotX1 = 100;
  plotX2 = width - plotX1;
  plotY1 = 100;
  plotY2 = height - plotY1;
  
  fill(255);
  rectMode(CORNERS);
  noStroke();
  rect(plotX1,plotY1,plotX2,plotY2);
  
  textAlign(CENTER);
  f = createFont("Arial",16,true);
  textFont(f);
  fill(0);
  text("MPG", width/2,height-plotY1/2);
  text("Miles per Gallon to Horsepower of Car Data Set", width/2,plotX1/2);
  text("HP", plotX1/2, height/2);
  
  stroke(200);
  //xy label
  
  for(int i = plotX1; i <= plotX2; i +=50) {
    f = createFont("Arial",16,true);
    //x
    textAlign(CENTER,CENTER);
    text(i/10-10,i,plotY2+10);
    //y
    textAlign(RIGHT,CENTER);
    text(i/2-50,plotX1-5,height-i);
    //line(plotX1,i,plotX2,i);
    //line(i,plotY2,i,plotY1);
  }
}

void draw() {
  float[] data;
  Table table = loadTable("cars.csv","header");
  float mpg = -999;
  float horsepower = 999;
  
  for (int j = 0; j < table.getRowCount(); j++) {
    TableRow row = table.getRow(j);
    //float mpg = row.getFloat(0);
    //float horsepower = row.getFloat(3);
    mpg = row.getFloat(0);
    horsepower = row.getFloat(3);
    fill(0);
    for(int i = plotX1; i <= plotX2; i +=50) {
      line(plotX1,i,plotX2,i);
      line(i,plotY2,i,plotY1);
    }
    float y_ = (horsepower*2+plotY1/2);
    float x_ = (mpg*10+plotX1);
    noStroke();
   fill(18,255,198,180); 
    ellipse(x_,y_,radius,radius);
    if(dist(x_,y_,mouseX,mouseY) < radius*2) {
  //rollover color/size change
  if(((x_-5) <= mouseX && mouseX <= (x_+5)) && ((y_-5) <= mouseY && mouseY <= (y_+5))) {
    fill(255,10,0,180);
   noStroke(); 
    ellipse(x_,y_,radius,radius);
  //ellipse(x_,y_,10,10);
  //radius++;
  }  else if (((x_-5) >= mouseX && mouseX >= (x_+5)) && ((y_-5) >= mouseY && mouseY >= (y_+5))) {
   fill(18,255,198,180); 
   ellipse(x_,y_,radius,radius);
  
    // fill(255);
   
  }
  // y is upside down!!!
  frame.setTitle("x = " + mpg+plotX1 + " y = " + (plotY2/2-horsepower-(plotY1/4)));
    }
  }  
}
