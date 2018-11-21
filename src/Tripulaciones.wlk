import Piratas.*
import TripulacionMonstruosa.*

class Tripulacion {
	var resistencia
	var poderDeFuego
	var municiones
	var property tripulantes
	var bando
	
	constructor(unaResistencia,unPoder,unasMuniciones,unosTripulantes,unBando){
		resistencia = unaResistencia
		poderDeFuego = unPoder
		municiones = unasMuniciones
		tripulantes = unosTripulantes
		bando = unBando
		bando.bonus(self)
	}
	
	method capitan(){
		return tripulantes.max({unTripulante => unTripulante.poderDeMando()})
	}
	
	method enfrentarseCon(otroBarco){
		var ganador = [self,otroBarco].max({unBarco => unBarco.fuerza()})
		var perdedor = [self,otroBarco].min({unBarco => unBarco.fuerza()})
		perdedor.herirTripulacion()
		ganador.sumarTripulantesFuertes(perdedor.tripulantes())
		perdedor.tripulantes().clear()
		perdedor.quedarDesolado()
	}
	
	method fuerza(){
		return tripulantes.sum({unTripulante => unTripulante.poderDeMando()})
	}
	
	method herirTripulacion(){
		tripulantes.forEach({unTripulante => unTripulante.serHerido()})
	}
	
	method sumarTripulantesFuertes(tripulacion){
		var tripulacionFuerte = tripulacion.filter({unTripulante => unTripulante.esFuerte()})
		self.agregarTripulantes(tripulacionFuerte)
	}
	
	method agregarTripulantes(unosTripulantes){
		tripulantes = (tripulantes + unosTripulantes).flatten()
	}
	
	method quedarDesolado(){
		resistencia = 0
		poderDeFuego = 0
		municiones = 0
	}
	
	method dispararContra(otroBarco,cantidad){
		if(municiones < cantidad){
			self.error("No se dispone de tal cantidad de municiones")
		}
		municiones -= cantidad
		otroBarco.disminuirResistencia(50*cantidad)
		otroBarco.eliminarDebiles()
	}
	
	method disminuirResistencia(cantidad){
		resistencia -= cantidad
	}
	
	method eliminarDebiles(){
		tripulantes.remove({unTripulante => unTripulante.estaDebil()}) //No esta en la guia de lenguajes pero tmp me tira error, ver si funca
	}
	
	method cambiarDeBando(nuevoBando){
		bando = nuevoBando
		nuevoBando.bonus(self)
	}
	
	method aumentarMuniciones(cantidad){
		municiones += cantidad
	}
	
	method aumentarPoderDeFuego(cantidad){
		poderDeFuego += cantidad
	}
}



///////////////////////////// Bandos ////////////////////////////////////////

object armadaInglesa{
	method bonus(unBarco){
		unBarco.aumentarMuniciones(unBarco.municiones()*0.3)
	}
}

object unionPirata{
	method bonus(unBarco){
		unBarco.aumentarPoderDeFuego(60)
	}
}

object armadaDelHolandesErrante{
	method bonus(unBarco){
		unBarco.agregarTripulantes(unBarco.tripulantes())
	}
}







