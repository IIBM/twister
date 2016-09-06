//cyntia vilte 29 de agosto gancho para sujetar al clip en un extremo

radio_mayor=2.5;
z1=1.2;

module gancho()
{
 union()
 {
  for(i=[0:1])
   rotate([i*180,0,0])   
    translate([0,0,z1+z1/2+0.075])   
     cube([radio_mayor*1.75,radio_mayor*2,z1],center=true);
   translate([radio_mayor/1.5+z1/2,0,0])
    cube([z1,radio_mayor*2,z1*3+z1+0.15],center=true);  
 }
}
gancho();
