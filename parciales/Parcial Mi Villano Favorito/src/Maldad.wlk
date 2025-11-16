import src.ObjetosARobar.*
import src.Minions.*
import src.Ciudad.*


object congelar {
    const cantidadNecesaria = 500 // <- de concentracion

    method puedeSerRealizadaPor(unMinion) {
        return unMinion.tieneRayoCongelante() and unMinion.nivelDeConcentracionNecesario()
    }

    method realizarse(ciudad, minions) {
        ciudad.disminuirTemperatura(30)
        minions.map({minion => minion.ganarBananas(10)})
    }
}

object robar {
    const objetoARobar = Piramide

    method puedeSerRealizadaPor(unMinion) {
        return unMinion.esPeligroso()
    }

    method realizarse(ciudad, minions) {
        objetoARobar.serRobado(ciudad, minions)
    }
}

// creo que podria mejorarse si hago la clase de las armas
// una clase para el rayo congelador y otra para el rayo encogedor 