import src.esclavo.*

class Granjero{
  
    var cantidadDeHijos = 0
    var cantidadDeHectareas = 0
    var armas = 0
    var rango = 0
    var dinero = 0
    var kills = 0

    method aumentarKills(cantidad) {
      kills += cantidad
    }

    method esGranjero() = true

    method tenerHijos(cantidad) {
      cantidadDeHijos += cantidad
    }

    method aumentarArmas(cantidad) {
      armas += cantidad
    }

    method kills() = kills 

    method noTieneArmas() = armas == 0 

    method soyEsclavo(unRango) = unRango.esEsclavo()

    method aumentarHectarias(cantidad) {
      cantidadDeHectareas += cantidad
    }

    method escalarSocialmente() {
      rango = rango.siguiente()
      rango.obtenerBeneficios(self)// tengo que hacerlo los rangos
    }

    method esEsclavoSinArmas() {
      return not self.soyEsclavo(rango) || self.soyEsclavo(rango) && self.noTieneArmas()
    }
    method puedeIrAExpedicion() {
      return 2* cantidadDeHijos <= cantidadDeHectareas && self.esEsclavoSinArmas()
    }

    method agregarBotin(botin) {
      dinero += botin
    }

    
}