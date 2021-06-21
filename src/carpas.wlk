import marcas.*
import jarras.*
import personas.*

class Carpa {
	const property genteDentro = []
	const property genteAdmitida
	const property tieneBanda
	const property marca
	
	method servirCerveza(unaPersona,tamanioJarra) {
		if (self.genteDentro().any( { p => p == unaPersona } ) )
			unaPersona.comprarCerveza(new Jarra(capacidad=tamanioJarra, marca=marca))
		else
			self.error("La persona no esta en la carpa")
	}
	
	method dejaIngresar(unaPersona) { 
		return self.genteAdmitida() > self.genteDentro().size() and
				not unaPersona.estaEbrio()
	}
	
	method admitir(unaPersona) {
		if (unaPersona.quiereEntrar(self) and self.dejaIngresar(unaPersona))
			self.genteDentro().add(unaPersona)
		else
			self.error("No se puede admitir a esta persona")
	}
	
	method ebriosEmpedernidos() = self.genteDentro().count( { p => p.esEmpedernido() } )
}