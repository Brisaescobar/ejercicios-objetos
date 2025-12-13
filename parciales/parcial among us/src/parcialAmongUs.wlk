class Jugador {
    var color 
    var mochila = []
    var nivelDeSospecha = 40 

    // punto 1 
    method esSospechoso() = nivelDeSospecha > 50 

    // punto 2 
    method buscarItem(unItem) = mochila.add(unItem)

    method aumentarNivelDeSospecha(unaCantidad) = nivelDeSospecha + unaCantidad

    method disminuirNivelDeSospecha(unaCantidad) = nivelDeSospecha - unaCantidad

    method tieneEnLaMochila(unItem) = mochila.contains(unItem)

    method nivelDeSospecha() = nivelDeSospecha
}

// Tripulante 
class Tripulante inherits Jugador {
    const tareas = []

    method hizoSusTareas() = tareas.isEmpty()

    method hacerTarea(unaTarea) {
        unaTarea.hacer(self)
        tareas.remove(unaTarea)
        Nave.informar(self)
    }
}

// Impostor
class Impostor inherits Jugador {
    method hizoSusTareas() = true

}


class Nave {
    var nivelDeOxigeno 
    var tripulantes 
    
    method aumentarNivelDeOxigeno(unaCantidad) = nivelDeOxigeno + unaCantidad

    method informar(unTripulante) {
        if(unTripulante.hizoSusTareas()) {
            self.error("Ganaron los tripulantes")
        }
    }
}

// tareas no lo hacen los impostores !! 

object arreglarTableroElectrico {
  method hacer(unTripulante) {
    const llaveInglesa
    if(unTripulante.tieneEnLaMochila(llaveInglesa)){
        unTripulante.aumentarNivelDeSospecha(10)
    }
  }
}

object sacarBasura {
    method hacer(unTripulante) {
        const escoba 
        const bolsaDeConsorcio
        if(unTripulante.tieneEnLaMochila(escoba) && unTripulante.tieneEnLaMochila(bolsaDeConsorcio)) {
            unTripulante.disminuirNivelDeSospecha(4)
        }
    }
}

object ventilarLaNave {
    method hacer(unTripulante) {
        Nave.aumentarNivelDeOxigeno(5)
    }
}


