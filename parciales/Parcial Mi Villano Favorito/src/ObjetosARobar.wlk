class ObjetoARobar {
    method serRobado(ciudad, minions) {
        ciudad.perderObjeto(self)
    }
}

class Piramide inherits ObjetoARobar {
    const altura 

    method puedeSerRobadoPor(unMinion) {
        return unMinion.nivelDeConcentracion(altura/2) 
    }

    override method serRobado(ciudad, minions) {
        super(ciudad, minions)
        minions.map({minion => minion.ganarBananas(10)})
    }
}

class SueroMutante inherits ObjetoARobar {
    method puedeSerRobadoPor(unMinion) {
        return unMinion.tieneAlMenos100Bananas() and unMinion.nivelDeConcentracionNecesario(23)
    }

    override method serRobado(ciudad, minions) {
        super(ciudad, minions)
        minions.map({minion => minion.consumirSueroMutante()})
    }
}

class LaLuna inherits ObjetoARobar {
    method puedeSerRobado(unMinion) {
        return unMinion.tieneRayoParaEnconger()
    }

    override method serRobado(ciudad, minions) {
        super(ciudad, minions)
        minions.map({minion => minions.adquirirRayoCongelantePotencia10()})
    }
}


