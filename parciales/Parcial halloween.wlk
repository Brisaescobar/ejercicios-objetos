class Niño {
    const trajes = []
    const maquillajes = []
    var actitud // 1 - 10
    var caramelos 
    var estado = sano 

    method caramelos() = caramelos
    
    method capacidadDeAsustar() = self.sumatoriaDeSusto() * actitud

    method sumatoriaDeSusto() = (trajes + maquillajes).sum({elemento => elemento.nivelDeSusto()})

    method asustarA(persona) {
        if(persona.puedeSerAsutadoPor(self)) {
            persona.darCaramelosA(self)
        }
    }

    method sumarCaramelos(unaCantidad) {
        caramelos += unaCantidad
    }

    method comerCaramelos(unaCantidad) {
        if(self.caramelos() > unaCantidad) {
            caramelos -= unaCantidad
        }
        else {
            self.error("No puede comer esa cantidad de caramelos")
        }
    }
}

// elementos 
class Maquillaje() {
    method nivelDeSusto() = 3
}

class Traje {
    const tipo

    method nivelDeSusto() = tipo.susto()
}

object tierno {
    const susto = 2

    method susto() = susto
}

object terrorifico {
    const susto = 5

    method susto() = susto
}

// adultos 
class AdultoComun {
    var niñosQueLoAsustaron = []

    method tolerancia() = 10 * niñosQueLoAsustaron.count(nene => nene.caramelos() > 15)

    method puedeSerAsutadoPor(unNene) = self.tolerancia < unNene.capacidadDeAsustar()

    method darCaramelosA(unNene) {
        self.tolerancia()/2 
        unNene.sumarCaramelos(unaCantidad)
    }
}

class Anciano inherits AdultoComun {
    override method puedeSerAsutadoPor(unNene) = true

    override method darCaramelosA(unNene) = super(unNene) / 2

}

class AncianoNecio inherits AdultoComun {
    override method puedeSerAsutadoPor(unNene) = false 
}

// legiones 
class legiones inherits Niño {
    var niños = #{}

    override method capacidadDeAsustar() = niños.sum({niño => niño.capacidadDeAsustar()})

    method cantidadDeCaramelos() = niños.sum({niño => niño.caramelos()})

    method lider() = niños.max({niño => niño.capacidadDeAsustar()})

    method validar() {
        if(niños.size() < 2) {
            self.error("No se puede crear una legion")
        }
    }

    override method asustarA(persona) {
        if(persona.puedeSerAsutadoPor(self)){
            persona.darCaramelosA(lider)
            // no se si esta bien
            // le tiene que dar los caramelos al lider
        }
    }

    override method sumarCaramelos(unaCantidad) {
        lider().sumarCaramelos(unaCantidad)
    }

    // no hay que cambiar porque lo modele como conjuntos
}

class Barrio {

    var niños = #{}

    method tresConMasCaramelos() = niños.sortBy({niño => niño.caramelos()}).take(3)

    // method elementosSinRepetidos() 
}

// Estado de salud 
class Estado {
    var nuevoEstado 

    method actitudReal(actitud)

   method comer(unNene, cantidad) {
        if(cantidad > 10){
            unNene.estado = nuevoEstado
        }
    }
}

object sano inherits Estado {
  var nuevoEstado = empachado
}

object empachado inherits Estado {
    var nuevoEstado = cama 

    override method actitudReal(actitud) = actitud / 2

}

object cama inherits Estado {
    method actitudReal(actitud) = 0

    override method comer(unNene, cantidad) {
        self.error("No puede comer mas caramelos")
    }
}

// revisar estados 

