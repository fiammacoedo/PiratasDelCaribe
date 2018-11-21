import Piratas.*
import Tripulaciones.*

class MonstruoHumanoide inherits PirataGuerrero{ // al hacerlo heredar de guerrero me obliga a asignarle una vitalidad, que este no tiene
	constructor(unaEnergia,unPoderDePelea,unaVitalidad) = super(unaEnergia,unPoderDePelea,unaVitalidad) 
	
	override method poderDeMando(){
		return poderDePelea
	}	
	
	override method serHerido(){}
}
