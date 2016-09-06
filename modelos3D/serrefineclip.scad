//cyntia vilte 29 de agosto parte del clip

radio_mayor=2.5;//lo utilizo para la parte redondeada de la punta
radio_menor=1.5;//lo utilizo para hacer los dientitos y para el agarre
z1=1.2; //de la parte de la base
fn1=20;

module clipp()
 {
  translate([0,0,radio_mayor])    
   rotate([90,0,0])
    union()
    {  
    difference()
    {
     union()
     {
      hull()//une un rectangulo y un cilindro,tal que su rellenado esta inclinado(en donde se debe agarrar el clip)
      {
     translate([-22,0,z1*3])
      rotate([0,9,0])  
       cube([z1,radio_mayor*2,z1],center=true);//un rectangulo en ubicacion alta
     translate([-4,0,0])  
      cylinder(r=radio_mayor,h=z1,$fn=fn1);//cilindro en la punta   
    }
    hull()//forma en mini "tobogan" del medio
    {
     translate([-22,-radio_mayor/2,z1*3])//es la parte de arriba que con los cilindros puedo agarrar
      rotate([0,9,0])  
       cube([z1,radio_mayor,z1],center=true);   
     translate([-32,-radio_mayor,-radio_mayor/2-0.25])//es un cubo que se encuentra en la parte baja y rellenandolo con la aparte de arriba forma el mini "tobogan" del medio
      rotate([0,-21,0])  
       cube([z1,radio_mayor,z1]);
    }
    hull()//une la punta en donde estan los dientitos, con la parte baja
    {
     translate([-32,-radio_mayor,-radio_mayor/2-0.25])
      rotate([0,-21,0])
       cube([z1,radio_mayor*2,z1]);
     translate([-50,-radio_mayor,-radio_menor/3])//la punta
      cube([radio_mayor,radio_mayor*2,radio_menor/3]);   
    }
   }
  union()//son los espacios cilindricos que utilizo para hacer los dientes y el agarre
  {
   for(i=[0:8])
    translate([1.2*i,0,i*-0.194])     
     translate([-21,0,z1*3.4])
      rotate([90,0,0])
       cylinder(r=z1/3.5,h=radio_mayor*2+0.1,center=true,$fn=fn1);//el agarre
   for(j=[0:40])
    translate([j/2.5,0,0])   
     translate([-50-radio_menor+2.5,0,0])
      rotate([90,0,0])
       cylinder(r=z1/8,h=radio_mayor*2+0.1,center=true,$fn=fn1);//los dientitos
   }    
  }
  hull()//es la otra punta, en donde no estan los dientitos
  {
   cylinder(r=radio_mayor,h=z1,$fn=fn1); 
   translate([-4,0,0])  
    cylinder(r=radio_mayor,h=z1,$fn=fn1);
  }
  }
 }
 clipp();
