import src.esclavo.*


class Soldado {
    var armas =  0
    var kills = 0
    var rango = 0
    var dinero = 0
    var hijos = 0

    method dinero() = dinero

    method hijos() = hijos

    method tenerHijos(cantidad) {
      hijos += cantidad
    }

    method armas() = armas 

    method esGranjero() = false

    method tieneArmas() = armas > 0

    method aumentarArmas(cantidad) {
      armas += cantidad
    }

    method kills() = kills
    
    method escalarSocialmente() {
      rango = rango.siguiente()
      rango.obtenerBeneficios(self)// tienen que hacerlo los rangos
    }

    method aumentarKills(cantidad) {
      kills += cantidad
    }

    method soyEsclavo(unRango) = unRango.esEsclavo() 

    method noTieneArmas() = armas == 0  

    method puedeIrAExpedicion() {
      return kills >20 && self.tieneArmas() && self.esEsclavoSinArmas()
    }

    method esEsclavoSinArmas() {
        return not self.soyEsclavo(rango) || self.soyEsclavo(rango) && self.noTieneArmas()
    }

    method agregarBotin(botin) {
      dinero += botin
    }

    
}