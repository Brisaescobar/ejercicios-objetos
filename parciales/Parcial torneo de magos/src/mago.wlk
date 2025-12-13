import src.objetosMagicos.*
import src.categoria.*

class Mago {
    var nombre
    var poderTotal 
    var poderInnato
    var objetosMagicos = []
    var puntosDeEnergiaMagica
    var resistenciaMagica 
    var poderBase

    method nombre() = nombre

    method poderBase() = poderBase

    method resistenciaMagica() = resistenciaMagica

    method puntosDeEnergiaMagica() = puntosDeEnergiaMagica

// punto 1
    method poderTotal() {
        var poderObjetos = objetosMagicos.map({objeto => objeto.poder().sum()})
        return poderObjetos * poderInnato
    }

// punto 2 
    method desafiar(otroMago) {
        otroMago.serDesafiadoPor(self)
    }
    /*  method serDesafiadoPor(atacante) {
        if(categoria.esVencido(self, atacante.poderTotal())) {
            var perderPuntos = categoria.puntosPerdidos(self, atacante.poderTotal()) 
            puntosDeEnergiaMagica -= perderPuntos
            atacante.puntosDeEnergiaMagica() + perderPuntos
        }
        no encuentra la categoria 
    } */
  
}


