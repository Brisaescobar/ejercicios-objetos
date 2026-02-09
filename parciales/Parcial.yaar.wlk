class Pirata {
    var property items = []
    var property nivelDeEbriedad = 0
    var property monedas = 0

    method tieneItem(unItem) = items.contains(unItem)
    method cantidadDeItems() = items.size()

    method estaPasadoDeGrog() = self.nivelDeEbriedad() >= 90 && self.tieneItem("botella de grogXD")

    method seAnimaASaquearA(victima) = victima.puedeSerSaquedoPor(self)

    method puedePagar(dinero) = monedas >= dinero 

    method tomarTragoDeGrog(ciudad) {
        self.gastar(ciudad.cuantoCobraElGrog())
        nivelDeEbriedad += 5
    }

    method gastar(dinero) {
        if(self.puedePagar(dinero)) {
            monedas -= dinero
        }
        else {
            self.error("No puede pagar esa cantidad de monedas")
        }
    }
}

class EspiaDeLaCorona inherits Pirata {
    override method estaPasadoDeGrog() = false 
    override method seAnimaASaquearA(victima) = super(victima) && self.tieneItem("permiso de la corona")
}

// pirata = new Pirata() BarbaNegra [ "brujula","cuchillo","cuchillo","dienteDeOro","botellaDeGrogXD","botellaDeGrogXD","botellaDeGrogXD"]

class Mision {

    method esUtil(unPirata) {}

    method puedeSerRealizadaPor(unBarco) = unBarco.superaPorcentajeDeOcupacion(90) 
    && self.cumpleCondicionesParaRealizarla(unBarco)

    method cumpleCondicionesParaRealizarla(unBarco) = true 

}
class BusquedaDelTesoro inherits Mision {

    override method esUtil(unPirata) = self.tieneAlgunItemUtil(unPirata) && unPirata.monedas() <= 5

    method tieneAlgunItemUtil(unPirata) = #{"brujula" , "loro", "cuchillo", "botella de grogXD"}.any({item => unPirata.tieneItem(item)})

    override method cumpleCondicionesParaRealizarla(barco) = barco.tieneItem("llave De Cofre")
}

class ConvertirseEnLeyenda inherits Mision {
    const property itemObligatorio 

    override method esUtil(unPirata) = unPirata.cantidadDeItems() >= 10 && unPirata.tieneItem(itemObligatorio)
}

class Saqueo inherits Mision {
    const property victima 

    override method esUtil(unPirata) = unPirata.monedas() < self.maximoDeMonedas() 
    && unPirata.seAnimarseASaquear(victima)

    method maximoDeMonedas() = configuracionSaqueos.maximoDeMonedas()

    override method cumpleCondicionesParaRealizarla(unBarco) = victima.esVulnerableA(unBarco)
}

object configuracionSaqueos {
    var property maximoDeMonedas = 0 
}

class BarcoPirata {
    var property mision
    const property capacidad 
    const property  tripulantes = #{} 

    method puedeSerSaqueadoPor(unPirata) = unPirata.estaPasadoDeGrog()

    method puedeFormarParteDeTripulacion(unPirata) = self.hayLugar() && mision.esUtil(unPirata)

    method hayLugar() = capacidad > self.cantidadDeTripulantes()

    method cantidadDeTripulantes() = tripulantes.size()

    method incorporarATripulacion(unPirata) =
        if(not self.puedeFormarParteDeTripulacion(unPirata)) {
            self.error("No se puede subir al barco")
        }
        else {
            tripulantes.add(unPirata)
        }

    method mision(nuevaMision) { 
        const piratasQueNoSirven = tripulantes.filter({pirata => not nuevaMision.esUtil() })
        mision = nuevaMision
        tripulantes.removeAll(piratasQueNoSirven)
    }

    method esTemible() = self.puedeRealizarMision() && tripulantes.count({pirata => mision.esUtil(pirata)})

    method esVulnerableA(unBarco) = unBarco.cantidadDeTripulantes() /2 >= self.cantidadDeTripulantes() 

    method tripulacionPasadaDeGrogXD() = tripulantes.all({tripulante => tripulante.estaPasadoDeGrog()})

    method puedeRealizarMision() = mision.puedeSerRealizadaPor(self)

    method itemMasRaro() = self.items().min ({item => self.cantidadDeTripulantesQueTienen(item)})

 	method cantidadDeTripulantesQueTienen(item) = tripulantes.count ({tripulante => tripulante.tieneItem(item)})

 	method items() = self.tripulantes().flatMap({tripulante => tripulante.items()})

    method anclarEn(ciudadCostera) {
        tripulantes.filter({tripulante => tripulante.puedePagar(ciudadCostera.cuantoCobraElGrogXD())}
        .forEach({tripulante => tripulante.tomarTragoDeGrog(CiudadCostera)}))
    
    const elMasEbrio = self.tripulanteMasEbrio()

    tripulantes.remove(elMasEbrio)
    ciudadCostera.sumarHabitante(elMasEbrio)
    }

    method tripulanteMasEbrio() = tripulantes.max({tripulante => tripulante.nivelDeEbriedad()})

    method superaPorcentajeDeOcupacion(porcentaje) = self.cantidadDeTripulantes() >= capacidad * porcentaje / 100

 	method tieneItem(item) = tripulantes.any {tripulante => tripulante.tieneItem(item)}

}

class CiudadCostera {
    var property cantidadDeHabitantes = 0

    method puedeSerSaqueadoPor(unPirata) = unPirata.nivelDeEbriedad() >= 50 

    method esVulnerableA(unBarco) = unBarco.cantidadDeTripulantes() >= self.cantidadDeHabitantes() * 0.4 
    || unBarco.tripulacionPasadaDeGrogXD()

    method sumarHabitante(unPirata) {
 		cantidadDeHabitantes += 1
    }
}

