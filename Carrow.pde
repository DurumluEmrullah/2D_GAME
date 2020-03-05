//EMRULLAH DURUMLU   
PVector okBaslangic =new PVector(1000,400);
PVector okBitis=new PVector(1070,400);
PVector okBaslangic2 =new PVector(1140,400);
PVector okBitis2=new PVector(1210,400);
PVector okBaslangic3 =new PVector(1280,400);
PVector okBitis3=new PVector(1350,400);
PVector okBaslangic4 =new PVector(1420,400);
PVector okBitis4=new PVector(1490,400);
PVector okBaslangic5 =new PVector(1560,400);
PVector okBitis5=new PVector(1630,400);
boolean kontrol=true,kontrol2=true,kontrol3=true,kontrol4=true,kontrol5=true;
boolean oyun =true;
PVector araba1=new PVector(100,475);
PVector araba2 = new PVector(200,475);

int r=30;
float angle=0;
int yon=-1;
PVector a1 =new PVector(100,100);
int r2=30;
PVector bas =new PVector(400,400);
int skor=0;
PVector hareket = new PVector (2.5,0);
PVector agacBaslangic=new PVector (100,300);
PVector px=new PVector(2.5,0);
PVector py=new PVector (0,2.5);
PVector px2 =new PVector(1,0);
int isik=1;
boolean zorluk=false;
int j;
int hiz=50;
boolean kapi = false;
PVector gunes =new PVector (500,500);




void setup(){

  size(1000,1000);
  
}



void draw(){
  frameRate (hiz);
 
  
  if(skor%20==0){zorluk=true; skor++;}
  if (zorluk==true){hiz+=10; zorluk=false;}
   //if(skor%10==0){kapi =true;}
   //if (kapi==true){hiz+=10; kapi=false;}
  if(oyun==true){
 
  okHareket();
  angle-=10;
  background(255);
  ok ok=new ok(okBaslangic,okBitis);
  ok ok2=new ok(okBaslangic2,okBitis2);
  ok ok3=new ok(okBaslangic3,okBitis3);
  ok ok4=new ok(okBaslangic4,okBitis4);
  ok ok5=new ok(okBaslangic5,okBitis5);
  
  yeniOk();
  
  araba a =new araba(araba1,araba2,r);
  far(araba2);


  agac agac =new agac(agacBaslangic);

  noFill();
  agacBaslangic.sub(hareket);


 if(agacBaslangic.x==-890){
     agacBaslangic.x=1090;
    }
 line(0,800,1000,800);
 line(0,300,1000,300);

 skorKontrol();
 ciz2();
 ciz("SKOR :",skor);
 noFill();
 hareketKontrol();
 oyunKontrol();

  }
  else{
  gameOver();
  yeniOyun();
  
   
  }
}// draw sonu





class ok {

ok(PVector p1,PVector p2){
  strokeWeight(3);
  line(p1.x,p1.y,p2.x,p2.y);
  line(p1.x+10*0.6944,p1.y-10*0.6944,p1.x,p1.y);
  line(p1.x+10*0.6944,p1.y+10*0.6944,p1.x,p1.y);
  line(p2.x+10*0.6944,p2.y+10*0.6944,p2.x,p2.y);
  line(p2.x+10*0.6944,p2.y-10*0.6944,p2.x,p2.y);
 strokeWeight(1);
}

}

class araba{
  
  araba (PVector p1,PVector p2,int yariCap){
    
  kasaCiz(p1,p2);
  noFill();
  cantCiz(p1,yariCap/2);
  cantCiz (p2,yariCap/2);
  }



}
void cantCiz(PVector p1,int r){
  
  
PVector c1,c2,c3,c4,c5,c6,c7,c8;
  translate(p1.x, p1.y);
    c1 = new PVector(r*cos(radians(0+yon*angle)), r*sin(radians(0+yon*angle)));
    c2 = new PVector(r*cos(radians(90+yon*angle)), r*sin(radians(90+yon*angle)));
    c3 = new PVector(r*cos(radians(180+yon*angle)), r*sin(radians(180+yon*angle)) );
    c7 = new PVector(r*cos(radians(270+yon*angle)), r*sin(radians(270+yon*angle)) );
    fill(#bebebe);
    beginShape();
    vertex(c1.x,c1.y); vertex(c2.x,c2.y); vertex(c3.x,c3.y);   vertex(c7.x,c7.y);   
    endShape(CLOSE);
    
    c4 = new PVector(r*cos(radians(45+yon*angle)), r*sin(radians(45+yon*angle)));
    c5 = new PVector(r*cos(radians(135+yon*angle)), r*sin(radians(135+yon*angle)));
    c6 = new PVector(r*cos(radians(225+yon*angle)), r*sin(radians(225+yon*angle)));
    c8 = new PVector(r*cos(radians(315+yon*angle)), r*sin(radians(315+yon*angle)) );
    //fill(0);
    
    beginShape();
    vertex(c4.x,c4.y); vertex(c5.x,c5.y); vertex(c6.x,c6.y);  vertex(c8.x,c8.y);   
    endShape(CLOSE); noFill();  
    translate(-p1.x, -p1.y);
    
    circle(p1.x,p1.y,2*r);
    
}
void kasaCiz(PVector p1,PVector p2){
fill(#BCA706);

beginShape();

vertex(p1.x,p1.y);//225,200
vertex(p2.x,p2.y);//375,200
vertex(p2.x+45,p2.y);
vertex(p2.x+45,p2.y-30);
vertex(p2.x,p2.y-30);
vertex(p2.x-30,p2.y-48);
vertex(p1.x+24,p1.y-48);
vertex(p1.x,p1.y-30);
vertex(p1.x-55,p1.y-30);
vertex(p1.x-55,p1.y);
vertex(p1.x,p1.y);

endShape(CLOSE);



}

class adam{
adam (PVector p1){

circle (p1.x,p1.y,30);
line (p1.x,p1.y+15,p1.x,p1.y+75);
line(p1.x,p1.y+15,p1.x-20,p1.y+35);
line(p1.x,p1.y+15,p1.x+20,p1.y+35);
line(p1.x,p1.y+75,p1.x-20,p1.y+95);
line(p1.x,p1.y+75,p1.x+20,p1.y+95);

}


}

class agac{

agac (PVector p ){
  fill(#05FA03);
  beginShape();
  vertex(p.x,p.y);
  vertex(p.x,p.y-80);
  vertex(p.x-50,p.y-80);
  vertex(p.x-20,p.y-120);
  vertex(p.x-40,p.y-120);
  vertex(p.x+20,p.y-160);
  vertex(p.x+80,p.y-120);
  vertex(p.x+60,p.y-120);
  vertex(p.x+90,p.y-80);
  vertex(p.x+40,p.y-80);
  vertex(p.x+40,p.y);
  endShape();
  
    beginShape();
  vertex(p.x+200,p.y);
  vertex(p.x+200,p.y-80);
  vertex(p.x+150,p.y-80);
  vertex(p.x+180,p.y-120);
  vertex(p.x+160,p.y-120);
  vertex(p.x+220,p.y-160);
  vertex(p.x+280,p.y-120);
  vertex(p.x+260,p.y-120);
  vertex(p.x+290,p.y-80);
  vertex(p.x+240,p.y-80);
  vertex(p.x+240,p.y);
  endShape();
 
     beginShape();
  vertex(p.x+400,p.y);
  vertex(p.x+400,p.y-80);
  vertex(p.x+350,p.y-80);
  vertex(p.x+380,p.y-120);
  vertex(p.x+360,p.y-120);
  vertex(p.x+420,p.y-160);
  vertex(p.x+480,p.y-120);
  vertex(p.x+460,p.y-120);
  vertex(p.x+490,p.y-80);
  vertex(p.x+440,p.y-80);
  vertex(p.x+440,p.y);
  endShape();
 
 
      beginShape();
  vertex(p.x+800,p.y);
  vertex(p.x+800,p.y-80);
  vertex(p.x+750,p.y-80);
  vertex(p.x+780,p.y-120);
  vertex(p.x+760,p.y-120);
  vertex(p.x+820,p.y-160);
  vertex(p.x+880,p.y-120);
  vertex(p.x+860,p.y-120);
  vertex(p.x+890,p.y-80);
  vertex(p.x+840,p.y-80);
  vertex(p.x+840,p.y);
  endShape();
  


}



}  

void far (PVector p){
  if(isik==1){
  fill(#A8E0D8);}
  else{fill(255);}
  beginShape();
  vertex(p.x+33,p.y-30);
  vertex(p.x+45,p.y-30);
  vertex(p.x+45,p.y-18);
  endShape(CLOSE);
  if(isik==1){
  noStroke();
  beginShape();
  vertex(p.x+45,p.y-30);
  vertex(p.x+275,p.y);
  vertex(p.x+105,p.y);
  vertex(p.x+45,p.y-18);
  endShape();
  stroke(1);
  }
  noFill();
}

void gameOver(){

textSize(150);

float sw=textWidth("Game Over");

text("Game Over",120,500);


}

void ciz(String c,int counter){
fill (255);
beginShape();

vertex(880,20);
vertex(880,100);
vertex(680,100);
vertex(680,20);
endShape(CLOSE);
fill(0);
textSize(20);

float sw=textWidth(c);

text(c,700,40);
text(counter,700+sw+20,40);


}
void ciz2(){
fill (255);
beginShape();

vertex(100,20);
vertex(650,20);
vertex(650,100);
vertex(100,100);
endShape(CLOSE);
fill(0);
textSize(20);

text("Far icin = f tusuna basiniz ",110,40);
text("İleri geri ve aşşağı yukarı için yon tuslarını kullanınız",110,60);
text("Her 20 skorda bir oyun hızlanır",110,80);




}

void okHareket(){
    okBaslangic.sub(px);
  okBitis.sub(px);
   okBaslangic2.sub(px);
  okBitis2.sub(px);
   okBaslangic3.sub(px);
  okBitis3.sub(px);
   okBaslangic4.sub(px);
  okBitis4.sub(px);
   okBaslangic5.sub(px);
  okBitis5.sub(px);

}

void yeniOk(){
 float y= random (300,800);
if(okBitis.x<0){
    
  okBaslangic.y=y;
  okBitis.y=y;
  okBaslangic.x=1000;
  okBitis.x=1070;
  kontrol=true;
  }
  if(okBitis2.x<0){
    
  okBaslangic2.y=y;
  okBitis2.y=y;
  okBaslangic2.x=1000;
  okBitis2.x=1070;
  kontrol2=true;
  }
  if(okBitis3.x<0){
    
  okBaslangic3.y=y;
  okBitis3.y=y;
  okBaslangic3.x=1000;
  okBitis3.x=1070;
  kontrol3=true;
  }
  if(okBitis4.x<0){
    
  okBaslangic4.y=y;
  okBitis4.y=y;
  okBaslangic4.x=1000;
  okBitis4.x=1070;
  kontrol4=true;
  }
  if(okBitis5.x<0){
    
  okBaslangic5.y=y;
  okBitis5.y=y;
  okBaslangic5.x=1000;
  okBitis5.x=1070;
  kontrol5=true;
  }


}
void oyunKontrol(){
 if((okBaslangic.x==(araba2.x+45)&&(okBaslangic.y>(araba2.y-30)&&okBaslangic.y<(araba2.y+(r/2))))||(okBaslangic.x==araba2.x&&(okBaslangic.y>araba2.y-48&&okBaslangic.y<araba2.y-30))){oyun=false;}
 if((okBaslangic2.x==(araba2.x+45)&&(okBaslangic2.y>(araba2.y-30)&&okBaslangic2.y<(araba2.y+(r/2))))||(okBaslangic2.x==araba2.x&&(okBaslangic2.y>araba2.y-48&&okBaslangic2.y<araba2.y-30))){oyun=false;}
 if((okBaslangic3.x==(araba2.x+45)&&(okBaslangic3.y>(araba2.y-30)&&okBaslangic3.y<(araba2.y+(r/2))))||(okBaslangic3.x==araba2.x&&(okBaslangic3.y>araba2.y-48&&okBaslangic3.y<araba2.y-30))){oyun=false;}
 if((okBaslangic4.x==(araba2.x+45)&&(okBaslangic4.y>(araba2.y-30)&&okBaslangic4.y<(araba2.y+(r/2))))||(okBaslangic4.x==araba2.x&&(okBaslangic4.y>araba2.y-48&&okBaslangic4.y<araba2.y-30))){oyun=false;}
 if((okBaslangic5.x==(araba2.x+45)&&(okBaslangic5.y>(araba2.y-30)&&okBaslangic5.y<(araba2.y+(r/2))))||(okBaslangic5.x==araba2.x&&(okBaslangic5.y>araba2.y-48&&okBaslangic5.y<araba2.y-30))){oyun=false;}


}
void skorKontrol(){
if(okBitis.x<araba1.x-75&&kontrol==true){skor++;
kontrol =false;}
if(okBitis2.x<araba1.x-75&&kontrol2==true){skor++;
kontrol2 =false;}
if(okBitis3.x<araba1.x-75&&kontrol3==true){skor++;
kontrol3 =false;}
if(okBitis4.x<araba1.x-75&&kontrol4==true){skor++;
kontrol4 =false;}
if(okBitis5.x<araba1.x-75&&kontrol5==true){skor++;
kontrol5 =false;}

}

void hareketKontrol(){
   if(keyPressed==true){
 if(keyCode==UP&&araba1.y>348){araba1.sub(py); araba2.sub(py);}
 if(keyCode==DOWN&&araba1.y<785){araba1.add(py); araba2.add(py);}
 if(keyCode==RIGHT&&(araba2.x+45)<=1000){araba1.add(px2);araba2.add(px2);}
 if(keyCode==LEFT&&(araba1.x-80)>=0){araba1.sub(px2); araba2.sub(px2);}
 if(key=='f'||key=='F'){isik*=-1;}
 }
 }
 
 
 void yeniOyun(){

textSize(30);

float sw=textWidth("Yeniden oynamak için R(|r) ye basınız: ");
text("Puanın :  "+skor,450,580);
text("Yeniden oynamak için (R|r) ye basınız: ",350,550);


if(key=='r'||key=='R'){
  skor=0;
  
  araba1.x=100;
  araba2.x=200;
  araba1.y=475;
  araba2.y=475;
agacBaslangic.x=100;
okBaslangic.x=1000;
okBitis.x=1070;
okBaslangic2.x=1140;
okBitis2.x=1210;
okBaslangic3.x=1280;
okBitis3.x=1350;
okBaslangic4.x=1420;
okBitis4.x=1490;
okBaslangic5.x=1560;
okBitis5.x=1630;
hiz=50;
oyun=true;
}

}
