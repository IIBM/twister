//cyntia vilte 13 de Octubre soporte en forma de U 
 
z_1=3.5;//lo que mide la base (en z)
z_2=20;//cuanto mide (en z) cada cilindro sin contar con la base
x1=4.85;
y1=0.45;//con y2 lo utilizo para ser la medida del radio de los cilindros
y2=1.8;
y_total=(2*y1)+y2;
x_total=52;//lo que mide el largo e la pieza
fn1=100;
radio_cilindro=1.5; // lo utilizo para el cilindro del medio

module soporte_U()
{
   
union() //une los dos cilindros grandes con la base
 {
  difference()
  {
  hull()//rellena los dos cilindros en cada esquina para dar forma a la base
   {
    for(i=[0,1])
     rotate([0,0,i*180])   
      translate([-y_total,0,0])
       translate([(x_total/2)-x1,0,0])    
        cylinder(r=y_total+0.55,h=z_1,$fn=fn1,center=true);   
   }
   cylinder(r=radio_cilindro,h=z_1+0.1,center=true,$fn=fn1);
   }
   
   difference()//forma el hueco rectangular en los dos cilindros
   {
    for(j=[0,1])//los dos cilindros grandes
     rotate([0,0,j*180])    
      translate([-y_total,0,z_1/2])
       translate([(x_total/2)-x1,0,0]) 
        cylinder(r=y_total+0.55,h=z_2,$fn=fn1);
    
    translate([0,0,z_2/4])//son los dos rectangulos que utilizo para hacer los huecos
     for(k=[0,1])
      rotate([0,0,k*180])    
       translate([-y_total,0,(z_2/2)])
        translate([(x_total/2)-x1,0,0])
         cube([(y_total*2)+1.5,y2,(z_2+0.1)],center=true);
   }
 }
}
soporte_U();
