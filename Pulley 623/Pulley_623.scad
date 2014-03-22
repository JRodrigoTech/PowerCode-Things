// Created from Code_Pulley_623 (x4).stl
// https://github.com/Mecan0/Code
// By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

/**************************/
// Parámetros de la pieza  /
/**************************/

dCoji	= 10.3 ;// Diámetro  del cojinete (10.3)
hPolea	= 1 ;	// Anchura de la pared de la polea (Normal = 1) (Strong = 2)
hCoji	= 5.2 ;	// Anchura del cojinete (5.2)
dEje	= 6 ;	// Diámetro del eje (6)
dPolea	= 15 ;	// Diámetro externo de la polea (Normal = 15) (Strong = 17)
hCorrea = 6 ;	// Anchura de la correa (6)

// Media polea para un cojinete
module Polea(){
	difference () {
		union() {
			// Cilindro - Base
			cylinder (h = 0.5, r = dPolea/2, $fn=100);
			// Cilindro - Canal para la correa
			translate([0, 0, 0.5])
			cylinder (h = 4, r = (dCoji/2)+hPolea, $fn=100);
			//	Chaflán entre la Base y el Canal
			translate([0, 0, 0.5])
			cylinder(h = 4-(hCorrea/2), r1 = dPolea/2, r2 = (dCoji/2)+hPolea, $fn=100);
		}	
		union() {
			// Taladro del eje
			translate([0, 0, -1])
			cylinder (h = 5, r = dEje/2, $fn=100);
			// Taladro del cojinete
			translate([0, 0, 4.5-hCoji/2])
			cylinder (h = 5, r = dCoji/2, $fn=100);
		}	
	 
	}
}

// Generamos la mitad de la polea

	Polea();
	
// Generamos la otra mitad de la polea
	difference(){
		// Trasladada y rotada
		translate([0, 0, 9])
		rotate([180, 0, 0])
		Polea();
		// Obertura para el cojinete
		translate([0, 0, 3])
		cylinder (h = 8, r = dCoji/2, $fn=100);
	}