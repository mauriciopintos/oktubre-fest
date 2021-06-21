import marcas.*

class Jarra {
	const property capacidad
	const property marca
	
	method contenidoDeAlcohol() = capacidad * marca.graduacion() * 0.01
}

