import marcas.*
import jarras.*
import carpas.*

class Persona {
	var property peso
	const property jarrasCompradas = []
	var property leGustaMusicaTradicional
	var property aguante
	
	method origen()
	
	method comprarCerveza(unaJarra) { jarrasCompradas.add(unaJarra) }

	method leGusta(unaMarca)
	
	method estaEbrio() = self.alcoholIngerido() * self.peso() > self.aguante()
	
	method alcoholIngerido() = self.jarrasCompradas().sum( { j => j.contenidoDeAlcohol() } )
	
	method quiereEntrar(unaCarpa) = self.leGusta(unaCarpa.marca()) and self.musicaOk(unaCarpa)
	
	method musicaOk(unaCarpa) = if (self.leGustaMusicaTradicional()) unaCarpa.tieneBanda() else not unaCarpa.tieneBanda()
	
	method puedeEntrar(unaCarpa) = self.quiereEntrar(unaCarpa) and unaCarpa.dejaIngresar(self)
	
	method entrar(unaCarpa) { unaCarpa.admitir(self) }
	
	method esEmpedernido() = self.jarrasCompradas().all( { j => j.capacidad() >= 1 } )
	
	method esPatriota() = self.jarrasCompradas().all( { j => j.marca().origen() == self.origen() } )
}

class Belga inherits Persona {
	override method origen() = "Belgica"
	override method leGusta(unaMarca) = unaMarca.lupulo() > 4
}

class Checo inherits Persona {
	override method origen() = "Republica Checa"
	override method leGusta(unaMarca) = unaMarca.graduacion() > 8
}

class Aleman inherits Persona {
	override method origen() = "Alemania"
	override method leGusta(unaMarca) = true
	override method quiereEntrar(unaCarpa) = super(unaCarpa) and unaCarpa.genteDentro().size().even()
}