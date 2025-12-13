import src.mago.Mago
import src.objetosMagicos.*

class Categoria {
    method puntosPerdidos(unMago, poderAtacante) {}
    method esVencido(unMago, poderAtacante) {}
}

class Aprendices inherits Categoria {
    override method esVencido(unMago, poderAtacante) {
      poderAtacante > unMago.resistenciaMagica()
    }

    override method puntosPerdidos(unMago, poderAtacante) {
        unMago.puntosdeEnergiaMagica() / 2 
    }
}

class Veteranos inherits Categoria {
    override method esVencido(unMago, poderAtacante) {
        poderAtacante >= unMago .resistenciaMagica() * 1.5
    }

    override method puntosPerdidos(unMago, poderAtacante) {
        unMago.puntosDeEnergiaMagica() / 4
    }
}

// los inmortales nunca son vencidos