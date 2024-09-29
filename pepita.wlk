import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()){ 
			"pepita-grande.png"}
		else if (self.position() == silvestre.position() || self.energia() <= 0) {
			"pepita-gris.png"
			}
		 else {
		"pepita.png"}
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}
	
	method caer(){
		if(self.position().y() > 0){
		position = position.down(1)
	}
	}

	method irA(nuevaPosicion) {
		if(!self.estaCansada()){
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
	} else{
		 self.terminar()
	}
	}


	method terminar(){
		game.stop()
	}

	method estaCansada() {
		return energia <= 0
	}
	

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}



}

