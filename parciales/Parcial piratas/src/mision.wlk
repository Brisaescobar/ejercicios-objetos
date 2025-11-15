import src.piratas.Pirata
import src.barcos.Barco


class Mision { // super clase
  method puedeSerRealizadaPor(barco) {
   return barco.superaPorcentajeDeOcupacion(90) && self.cumpleCondicionesParaRealizarla(barco)
  }
  
  method cumpleCondicionesParaRealizarla(barco) = true
  method tieneItem(item) = false
  method tripulacionPasadaDeBotellas() = false
}

class BusquedaDelTesoro inherits Mision{
   method esUtil(pirata) {
        return self.tieneAlgunItemUtil(pirata) && pirata.monedas() <= 5
   } 

   method tieneAlgunItemUtil(pirata) {
    return #{"brujula", "mapa", "botella"}.any({items => pirata.tieneItemUtil(items)})
   }

  override method cumpleCondicionesParaRealizarla(barco) {
    return barco.tieneAlgunItemUtil("llaveDeCofre")
   }
}

class ConvertiseEnLeyenda inherits Mision {
    const itemObligatorio 

    method esUtil(pirata) {
        return pirata.cantidadDeItems() > 10 && pirata.tieneItemUtil(itemObligatorio)
    }
}

class Saqueo inherits Mision {
    const victima
    method esUtil(pirata) {
      pirata.monedas() < self.maximoDeMonedas() && pirata.seAnimarseASaquear(victima)
    }

    method maximoDeMonedas() = configuracionSaqueos.maximoDeMonedas()

    override method cumpleCondicionesParaRealizarla(barco) {
    return victima.esVulnerable()
   }
    
}
 
object configuracionSaqueos {
  var property maximoDeMonedas = 0
}

