// https://docs.google.com/document/d/1a_na04DHkp65uG_ts5IiLJ2RT3dfkD1Vl_Gw5E_dLUk/edit?tab=t.0

class Juego {
    const property nombre 
    const property precio // no hay inflacion
    const property cayegoria

    method afectarA(jugador, horasJugadas)
}
// tipos de juego
class Violento inherits Juego {
    override method afectarA(jugador, horasJugadas) {
        jugador.disminuirHumor(10 * horasJugadas)
    }
}

class Moba inherits Juego {
    override method afectarA(jugador, horasJugadas) {
        jugador.comprarSkins(30)
    }
}

class Terror inherits Juego {
    override method afectarA(jugador, horasJugadas) {
        jugador.actualizarSuscripcion(infantil)
    }
}

class Estrategicos inherits Juego {
    override method afectarA(jugador, horasJugadas) {
        jugador.aumentarHumor(5)
    }
}
// gameflix
class Gameflix {
    var juegos = #{}
    var usuarios = #{}
  
    method filtarJuegos(unaCategoria) = juegos.filter({juego => juego.categoria() == unaCategoria})

    method buscarJuegos(nombreDelJuego) {
        var juegoEncontrado =  juegos.find({ juego => juego.nombre() == nombreDelJuego})

        if(juegoEncontrado == null) {
            self.error("juego no encontrado")
        } // creo que es medio algoritmico

        return juegoEncontrado
    }

    method recomendarJuego() = juegos.anyOne()
}   

// usuario 
class Usuario {
    var property suscripcion = prueba
    var property dinero = 0
    var property humor = 0

    method aumentarHumor(unaCantidad) {
        humor += unaCantidad
    }

    method disminuirHumor(unaCantidad){
        humor -= unaCantidad
    }

    method filtarJuego(gameFlix,unaCategoria) {
        gameFlix.filtarJuegos(unaCategoria)
    }

    method buscarJuego(gameFlix, nombreJuego) {
        gameFlix.buscarJuegos(nombreJuego)
    }

    method recomendar(gameFlix) {
        gameFlix.recomendarJuego()    
    }

    method disminuirDinero(unaCantidad) {
        dinero -= unaCantidad 
    }

    method pagarSuscripcion() {
        if(dinero < suscripcion.costo()) {
            self.suscripcion(prueba)
            self.error("No tiene dinero sufiencente rey :(")
        } else {
            self.disminuirDinero(suscripcion.costo())
        }
    }

    method actualizarSuscripcion(nuevaSuscripcion){
        suscripcion =  nuevaSuscripcion
    }

    method comprarSkins(unaCantidad) {
        self.disminuirDinero(unaCantidad)
    }

    method jugarJuego(unJuego, horasJugadas){
        if(suscripcion.puedeJugar(unJuego)){
            unJuego.afectarA(self,horasJugadas)
        }
    }
}

// tipos de suscripciones
object premium {
    var property costo = 50

    method puedeJugar(unJuego) = true 
}

object base {
    var property costo = 25

    method puedeJugar(unJuego) = unJuego.precio() < 30 
}

object infantil {
    var property costo = 10

    method puedeJugar(unJuego) = unJuego.categoria() == "infantil"
}

object prueba {
    var property costo = 0

    method puedeJugar(unJuego) = unJuego.categoria() == "demo"
}


