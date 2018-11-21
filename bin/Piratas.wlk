class Pirata {
	var energia
	
	constructor(unaEnergia){
		energia = unaEnergia
	}
	
	method poderDeMando()
	
	method tomarRonCon(unPirata){
		self.disminuirEnergia(50)
	}
	
	method disminuirEnergia(cantidad){
		energia -= cantidad
	}
	
	method esFuerte(){
		return self.poderDeMando()>100
	}
	
	method serHerido()
	
	method estaDebil(){
		return energia < 20
	}
}

class PirataGuerrero inherits Pirata{
	var poderDePelea
	var vitalidad
	
	constructor(unaEnergia,unPoder,unaVitalidad) = super(unaEnergia){
		poderDePelea = unPoder
		vitalidad = unaVitalidad
	}
	
	override method poderDeMando(){
		return poderDePelea*vitalidad
	}
	
	override method serHerido(){
		poderDePelea /= 2
	}
}

class PirataNavegador inherits Pirata{
	var inteligencia
	
	constructor(unaEnergia,unaInteligencia) = super(unaEnergia){
		inteligencia = unaInteligencia
	}
	
	override method poderDeMando(){
		return inteligencia**2
	}

	override method serHerido(){
		inteligencia /= 2
	}
}

class PirataCocinero inherits Pirata{
	var moral
	var ingredientes
	
	constructor(unaEnergia,unaMoral,unosIngredientes) = super(unaEnergia){
		moral = unaMoral
		ingredientes = unosIngredientes
	}
	
	override method poderDeMando(){
		return moral * ingredientes.size()
	}
	
	override method tomarRonCon(unPirata){
		super(unPirata)
		self.serRobadoPor(unPirata)
	}
	
	method serRobadoPor(unPirata){
		var ingredienteRobado = ingredientes.anyOne()
		ingredientes.remove(ingredienteRobado)
		unPirata.robar(ingredienteRobado)
	}
	
	override method serHerido(){
		moral /= 2
	}
}

object jackSparrow{  // hereda de pirata
	var energia = 500
	var poderDePelea = 200
	var inteligencia = 300
	var ingredientes = [botellaDeRon]
	
	method poderDeMando(){
		return energia*poderDePelea*inteligencia
	}
	
	method tomarRonCon(unPirata){
		self.aumentarEnergia(100)
		unPirata.tomarRonCon(self)
	}
	
	method aumentarEnergia(cantidad){
		energia += cantidad
	}
	
	method robar(unIngrediente){
		ingredientes.add(unIngrediente)
	}
}

object botellaDeRon{}
