import marcas.*
import carpas.*

class Jarra {
	const property capacidad
	const property servidaEn
	const property precio = self.servidaEn().precioDeVenta() * self.capacidad()
	
	method marca() = self.servidaEn().marca()
	
	method contenidoDeAlcohol() = self.capacidad() * self.marca().graduacion() * 0.01
	
}

