//cyntia vilte 29 de agosto soporte en forma de U 
 
z_1=3.5;//lo que mide la base (en z)
z_2=20;//cuanto mide (en z) cada cilindro sin contar con la base
y1=0.4;//con y2 lo utilizo para ser la medida del radio de los cilindros
y2=1.8;
y_total=(2*y1)+y2;
fn1=100;

module soporte_U()
{
union() //une los dos cilindros grandes con la base
 {
  hull()//rellena la distancia entre los dos cilindros en cada esquina para dar forma a la base
   {
    for(i=[0,1])
     rotate([0,0,i*180])   
      translate([-y_total,0,0])
       translate([20.15,0,0])    
        cylinder(r=y_total,h=z_1,$fn=fn1,center=true);//base de cilindros   
   }
  difference()//forma el hueco rectangular en los dos cilindros
   {
    for(j=[0,1])//los dos cilindros grandes
     rotate([0,0,j*180])    
      translate([-y_total,0,z_1/2])
       translate([20.15,0,0]) 
        cylinder(r=y_total,h=z_2,$fn=fn1);
    
    translate([0,0,z_2/4])//son los dos rectangulos que utilizo para hacer los huecos entre los cilindros
     for(k=[0,1])
      rotate([0,0,k*180])    
       translate([-y_total,0,(z_2/2)])
        translate([20.15,0,0])
         cube([(y_total*2)+0.1,y2,(z_2+0.1)],center=true);
   }
 }
}
soporte_U();
