import src.persona.*
class EnfermedadInfecciosa {
  
    var celulasAmenazadas = 0
    var vecesQueAfecto = 0

    method afecto() {
      vecesQueAfecto += 1
    }
  
    method celulasAmenazadas() = celulasAmenazadas 

    method milesimaParte() = self.celulasAmenazadas() * 0.001

    method reproducirse( ) {
        celulasAmenazadas = 2* self.celulasAmenazadas()
    }

    method afectar(persona) {
      persona.modificarTemperatura(self.milesimaParte())
      self.afecto()
    }

    method esAgresiva(persona) =  self.celulasAmenazadas() > persona.diezPorcientoDeCelulasTotales()

    

}

const malaria500 = new EnfermedadInfecciosa(celulasAmenazadas = 500) 
const otitis = new EnfermedadInfecciosa(celulasAmenazadas = 100) 
const malaria800 = new EnfermedadInfecciosa(celulasAmenazadas = 800)


object lupus {

    var vecesQueAfecto = 0
    const celulasAmenazadas = 10000

    method celulasAmenazadas() = celulasAmenazadas

    method afecto() {
      vecesQueAfecto += 1
    }

    method afectar(persona) {
      persona.destruirCelulas( self.celulasAmenazadas())
      self.afecto()
    }

    method esAgresiva(persona) = vecesQueAfecto > 30  
  
} 
  

