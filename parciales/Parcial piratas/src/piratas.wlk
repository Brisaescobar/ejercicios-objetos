import src.barcos.*
import src.mision.*
class Pirata {
    var items = ["botella", "mapa", "brujula", "llaveDeCofre", "cuchillo"]
    var nivelDeEbriedad = 0
    var monedas = 0

    method tieneItemUtil(unItem) = items.contains(unItem)

    method seAnimarseASaquear(victima) {
      victima.puedeSerSaqueadoPor(self)
    }

    method pasadoDeBotellas(){
       return self.nivelDeEbriedad() >= 90 && self.tieneItemUtil("botella")
    }

    method nivelDeEbriedad() {
        return nivelDeEbriedad
    }
} 
