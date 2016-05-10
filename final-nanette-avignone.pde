//Nanette Avignone CST112
//Final 

float x, y;                  
float sidewalk;
int spacing=60;
int many=8;

Bird black;


String title= "Final";
String subtitle1= "Press 't' key to move tallest to the end.";
String subtitle2= "Press 'w' key to move widest to the end";
String subtitle3= "Press 'r' key to reset.";
String subtitle4= "Press 'q' key to quit.";
String subtitle5= "Press 'o' key to move oldest to the end";
String author=  "Nanette Avignone, CST112";
String names=  "Sammy,            Midnight,      Patches,     Sneakers,      Thomas,         Maggie,        Friskey,        Snowball";

// ARRAY OF PERSONS//

Person [] people = new Person [many];

//Trying to get second array
//Person2 [] avig = new Person2 [11]; 


//SETUP: define screen size//
void setup() {
  size (750, 550 );
  x = 0;
  y = 0;   
  sidewalk = height/1.5;  
  reset();
  black= new Bird();
}
void reset() {
  for (int i=0; i<many; i++) {
    people[i]=new Person ();
  }

//Trying to get second array  
  /*     
   for (int a=0; a<11; a++){          
   people[a]=new Person2 ();
   }
   */
 }



//DRAW: sky, sidewalk //
void draw() {
  background (135, 206, 250);          //sky
  scene();
  message();
  button();
  black.show(); 
  black.move();

  // Show all people.
  x=100;
  y=sidewalk;
  for (int i=0; i<many; i++) {
    people[i].show( x, y );
    x=  x + 80;
  }
  //Trying to get second array
  /*  for (int a=0; a<11; a++) {
   people[a].show( x, y );
   x=  x + 80;
   }
   */
} 

//SCENE:
void scene() {           

  fill (192, 192, 192 );
  rect ( 0, sidewalk, width, height-sidewalk );    //gray ground
  stroke (255, 255, 255);
  fill (255, 255, 255);
  while (x <= width) {
    ellipse  ( x-100, y-200, 50, 30);        //cloud    
    x = x + spacing;
  }
}
// new scene
/*void scene2() {
  stroke( 0, 0, 127 );    
  background ( 0, 0, 127 );          //sky          
  fill (0, 255, 0 );
  rect ( 0, sidewalk, width, height-sidewalk );    //green groung
  fill (255, 255, 255 );
  ellipse( 350, 100, 50, 50 );      //moon
} 
*/

//MESSAGES: title and author 
void message() {  
  fill (0);
  textSize(20);
  text (title, width/2, 20 );
  textSize(12);
  text (subtitle1, width/3, 35 );
  text (subtitle2, width/3, 55 );
  text (subtitle3, width/3, 75 );
  text (subtitle4, width/3, 95 );
  text (subtitle5, width/3, 115 );  
  text (author, 10, 20);
  text (names, 100, sidewalk + 50 );
}


//// EVENT HANDLERS
void keyPressed() {
  if (key == 'q') exit();
  if (key == 'r') reset();
  if (key == 't') tall( people, many );
  if (key == 'w') widest( people, many );
  if (key == 'o') age( people, many );
}
void tall( Person[] p, int m ) {
  //// Move tallest to end.
  int k=0;
  // Find tallest
  for ( int j=1; j<many; j++ ) {
    if (p[j].tall > p[k].tall) {
      k=j;
    }
  }  
  // Move it to end (swap).
  Person save;
  save=  p[m-1];
  p[m-1]=  p[k];
  p[k]=  save;
}

void widest( Person[] p, int m ) {
  //// Move t to end.
  int k=0;
  // Find widest
  for ( int j=1; j<many; j++ ) {
    if (p[j].wide > p[k].wide) {
      k=j;
    }
  }  
  // Move it to end (swap).
  Person save;
  save=  p[m-1];
  p[m-1]=  p[k];
  p[k]=  save;
}
void age( Person[] p, int m ) {
  //// Move oldest to end.
  int k=0;
  // Find tallest
  for ( int j=1; j<many; j++ ) {
    if (p[j].age > p[k].age) {
      k=j;
    }
  }  
  // Move it to end (swap).
  Person save;
  save=  p[m-1];
  p[m-1]=  p[k];
  p[k]=  save;
}



//CLASS DEFINITIONS///

class Person {

  float r=255, g=0, b=0;  
  int tall= int( random( 90, 150 ) );
  int wide= int( random( 15, 70 ) );
  float age;

  // CONSTRUCTOR
  Person() {
    r=  random( 255 );
    g=  random( 255 );
    b=  random( 255 );
    age= random ( 10, 100 );
  }

  //Display People
  void show( float x, float y ) { 
    stroke ( 0, 0, 0 );
    strokeWeight(2);
    fill ( r, g, b );  
    rect ( x, y, wide, -tall );
    float hh=tall/3;
    ellipse( x+wide/2, y-tall-hh/3, hh, hh*3/4 );
    stroke(0);
    strokeWeight(2);
    fill(255, 255, 255);
    ellipse( x+wide/4, y-tall-hh/3, 6, 8 );  
    ellipse( x+wide*3/4, y-tall-hh/3, 6, 8 );  
    strokeWeight(1);  
    rect( x+wide/2-5, y -tall-5, 12, 2);
  }
}

//Trying to get second array
/* Person(2) {
 r=  random( 255 );
 g=  random( 255 );
 b=  random( 255 );
 
 }
 
 //Display People
 void show( float x, float y ) { 
 stroke ( 0, 0, 0 );
 strokeWeight(2);
 fill ( r, g, b );  
 rect ( x, y, wide,-tall );
 float hh=tall/3;
 ellipse( x+wide/2, y-tall-hh/3, hh,hh*3/4 );
 stroke(0);
 strokeWeight(2);
 fill(255, 255, 255);
 ellipse( x+wide/4, y-tall-hh/3, 6, 8 );  
 ellipse( x+wide*3/4, y-tall-hh/3, 6, 8 );  
 strokeWeight(1);  
 rect( x+wide/2-5, y -tall-5, 12, 2);
 }
 }
 */

class Bird {
  float x, y;
  float dx= 4, dy = 2;
  int flap;


  // Display bird

  void show() { 
    fill (0, 0, 0);  
    stroke (0, 0, 0);
    ellipse ( x+50, y+50, 40, 10);        //body
    ellipse ( x+70, y+47, 10, 10 );       //head
    //triangle ( x+35, y+50, x+65, y+50, x+50, y+70);   //wing
    triangle ( x+35, y+50, x+65, y+50, x+50, y+flap);   //wing
    if (x>0) { 
      flap=25;
    }
    if (x<200) { 
      flap=70;
    }
  }
  void move () {
    y=  y + 1;
    if (y > height) y= 0;   
    x=  x + dx;               
    y=  y + dy;
  }
}  
// Show buttons 
void button() {
  // button 1
  stroke (0);
  strokeWeight(2);
  fill (255, 255, 255 );
  rect ( 200, 600, 60, 35 );
  fill (0);
  text ("Tallest", 210, 620 );
  //button 2
  stroke (0);
  strokeWeight(2);
  fill (255, 255, 255 );
  rect ( 300, 600, 60, 35 );
  fill (0);
  text ("Widest", 310, 620 );
}
  //try to get buttons to work
void mousePress (Person[] p, int m) {
    if ( x>=200 && x<=260 && y>=600 && y<=635 ) {
      // Move tallest to end.
      int k=0;
      for ( int j=1; j<many; j++ ) {
        if (p[j].tall > p[k].tall) {
          k=j;
        }
      }  
      // Move it to end (swap).
      Person save;
      save=  p[m-1];
      p[m-1]=  p[k];
      p[k]=  save;
    }
}

