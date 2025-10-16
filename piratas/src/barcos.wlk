import src.piratas.*
import src.mision.*
class Barco {
    var tripulacion = #{}
    var capacidad = 0
    var mision 

    method puedeSerSaqueadoPor(pirata) {
        return pirata.pasadoDeBotellas() // pasado de grogXD
    }

    method puedeFormarParteDeUnaTripulacion(pirata) {
        return self.hayLugar() && mision.esUtil(pirata)
    }

    method hayLugar() {
      return capacidad > self.cantidadDeTripulantes()
    }

    method cantidadDeTripulantes() {
      return tripulacion.size()
    }

    method incorporarPirataAtripulacion(pirata) {
        if(not self.puedeFormarParteDeUnaTripulacion(pirata)){
            throw new Exception (message = "no puede formar parte de la tripulacion")
        }
        else {
          tripulacion.add(pirata)
        }
    }
    method cambiarMision(otraMision){
      mision = otraMision
      const piratasQueNoSirven = tripulacion.filter({pirata => not otraMision.esUtil(pirata)})
      tripulacion.removeAll(piratasQueNoSirven)
    }
    
    method esTemible() { 
      self.puedeHacerSuMision() && tripulacion.count({pirata => mision.esUtil(pirata)}) > 5  // count filtra y cuenta
    }

    method puedeHacerSuMision(){
      self.superaPorcentajeDeOcupacion(90) &&  mision.puedeSerReliazadaPor(self)
    }

    method tripulacionPasadaDeBotellas() {
      return tripulacion.all({tripulacion => tripulacion.pasadoDeBotellas()})
    } 

    method esVulnerable(barco) {
      barco.cantidadDeTripulantes() / 2 >= self.cantidadDeTripulantes()
    }

    method superaPorcentajeDeOcupacion(porcentaje) {
      return self.cantidadDeTripulantes() >= capacidad * porcentaje / 100
    }

    method tieneItem(item) {
      return tripulacion.any({tripulacion => tripulacion.tieneItem(item)})
    }

    method tripulantesMasEbrio() {
      return tripulacion.filter({pirata => pirata.nivelDeEbriedad()})
    }
}

class CiudadCostera {
  var cantidadDeHabitantes = 0

  method puedeSerSaqueadoPor(pirata) {
    return pirata.nivelDeEbriedad() >= 50
  }

  method cantidadDeHabitantes() {
    return cantidadDeHabitantes 
  }

  method esVulnerable(barco) {
    barco.cantidadDeTripulantes() >= self.cantidadDeHabitantes()* 0.4  || barco.tripulacionPasadaDeBotellas()
  }
}



