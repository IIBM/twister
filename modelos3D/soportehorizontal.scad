//cyntia vilte 22 de agosto, soporte horizontal

z_total=3.7;//medida en el eje z
x1=5;//la medida en el eje x de cada hueco recatangular
y1=1.2; //con la suma de y1 e y2 da el total de la medida en el eje y
y2=1.65; 
y_total=(2*y1)+y2; //medida en el eje y
x_total=50; //medida en el eje x
radio_medio=3;//el radio del cilindro en el medio
radio_chico=0.5;//la medida del hueco en el medio
fn1=100;

module soporte_horizontal()
{
 difference()//para hacer el hueco del medio
 {
  union()//une el cilindro del medio con lo demas
   {
    difference()//los huecos rectangulares en cada esquina
     {
      cube([x_total,y_total,z_total],center=true);
       for(j=[0,1])
        rotate([0,0,j*180])   
         for(i=[0,1])
          translate([0,i*(-y_total+y1-0.1),0])   
           translate([-x1,(y_total/2)-y1,0])  
            translate([(x_total/2)-x1,0,-z_total/2-0.1]) 
             cube([x1+0.1,y1+0.1,z_total+0.15]);//la medida de cada hueco rectangular
     }
    cylinder(r=radio_medio,h=z_total,center=true,$fn=fn1);//cilindro del medio 
   }
  hull()//el hueco que se encuentra en el medio del cilindro
   {
    for(k=[0,1])
     rotate([0,0,k*180])   
      translate([radio_medio-radio_chico,0,0])
       cylinder(r=radio_chico+0.1,h=z_total+0.1,center=true,$fn=fn1);//seran dos cilindros de los cuales relleno el espacio entre ellos para hacer el hueco
   }
 }
} 
soporte_horizontal();
