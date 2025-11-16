import src.Minions.*

class Villano {
    const minions = []
    const ciudad

    method nuevoMinion() {
        self.agregar(self.crearNuevoMinion())
    }

    method crearNuevoMinion() {
        return new Minions(bananas = 5, tipo = Amarillo) // falta las armas tengo que corregir eso
    }

    method agregar(unMinion) {
        minions.add(unMinion)
    }

    method otorgarArma(unMinion, unArma) {
        unMinion.agregarUnArma(unArma)
    }

    method alimentar(unMinion, bananas) { 
        unMinion.alimentarse(bananas)
    }

    method planificar(unaMaldad) {
        self.minionsQuePuedanRealizar(unaMaldad).realizarMaldad(unaMaldad, ciudad)
    }
    
    method minionsQuePuedanRealizar(unaMaldad) {
        const minionQuePuedanRealizarUnaMaldad = self.encontarMinionsUtilesPara(unaMaldad)
        if(self.noHayMinionCapaz(minionQuePuedanRealizarUnaMaldad)){
            self.error("No hay Minion capaz de realizar una maldad")
        }
        return minionQuePuedanRealizarUnaMaldad
    }

// nombre mas largo no habia?

    method noHayMinionCapaz(minionQuePuedaRealizarUnaMaldad) {
        return minionQuePuedaRealizarUnaMaldad.size() == 0
    }

    method encontarMinionsUtilesPara(unaMaldad){
        return minions.filter({minion => minion.puedeRealizar(unaMaldad)})
    }

    method cantidadDeMinions() {
        return minions.size()
    }

    method minionMasUtil() {
        minions.max({minion => minion.maldades()})
    }
    
    method minionsInutiles() {
        minions.filter({minion => minion.sinMaldad()})
    }
}