class Minions {
    var bananas 
    var armas = #{}
    var tipo = Amarillo 
    var property maldades = 0

    method agregarUnArma(unArma) {
        armas.add(unArma)
    }

    method alimentarse(cantidadDeBananas){
        bananas += cantidadDeBananas
    }

    method cantidadDeBananas() {
        return bananas
    }

    method armaMasPotente() { // deberia usar max ?
        return armas.filter({arma => arma.potencia()})
    }

    method convertirseEnVioleta() {
        tipo = Violeta 
        self.perderBananas()
        armas = #{} 
    }

    method convertirseEnAmarillo() {
        tipo = Amarillo
        self.perderBananas()
    }

    method consumirSueroMutante() {
        tipo.tomarSuero(self)
    }

    method perderBananas() {
        bananas = bananas - 1
    }

    method realizarMaldad(maldad, ciudad) {
        maldad.realizarse(ciudad, self)
    }

    method puedeRealizar(unaMaldad) {
       unaMaldad.puedeSerRealizadaPor(self) 
    }

    method tieneRayoCongelante() {
        armas.contains("Rayo congelante")
        // armas.find({arma => arma.sirveParaCongelar()})
    }

    method nivelDeConcentracionNecesario(cantidadNecesaria){
        return tipo.nivelDeConcentracion() > cantidadNecesaria
    }

    method ganarBananas(unaCantidad) {
        bananas += unaCantidad // para que gane las 10 bananas
    }

    method tieneAlMenos100Bananas() {
        return self.cantidadDeBananas() >= 100
    }

    method tieneRayoParaEnconger() {
        return armas.find({arma => arma.sirveParaCongelar()})
    }

    method adquirirRayoCongelantePotencia10() {
        self.agregarUnArma("rayo congelante")
    }

    method sinMaldad() {
        return maldades == 0
    }
}   

class TipoDeMinion {
    method nivelDeConcentracion(unMinion) {
        unMinion.cantidadDeBananas()
    }

    method esPeligroso(unMinion){
        unMinion.tieneDosArmas()
    }

    method tomarSuero(unMinion) // para sobreescribir
}

class Amarillo inherits TipoDeMinion {
    override method nivelDeConcentracion(unMinion) {
        unMinion.armaMasPotente() + unMinion.cantidadDeBananas()
    }

    override method tomarSuero(unMinion) {
        unMinion.convertirseEnVioleta()
    }
}


class Violeta inherits TipoDeMinion {
   
    override method esPeligroso(minion) {}
    // creo que iria un return true porque es siempre

    override method tomarSuero(unMinion) {
    // se convierte en amarillo
   }
}