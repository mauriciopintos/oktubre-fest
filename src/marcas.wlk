class Marca {
	var property lupulo
	var property origen
	method graduacion()
}

class CervezaRubia inherits Marca {
	var property graduacion
}

class CervezaNegra inherits Marca {
	override method graduacion() = graduacionReglamentaria.valor().min(self.lupulo() * 2)
}

class CervezaRoja inherits CervezaNegra {
	override method graduacion() = super() * 1.25
}

object graduacionReglamentaria {
	var property valor
}