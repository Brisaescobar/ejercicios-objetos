class Gremio {
    var miembros
    var poderTotalGremio 
    var reservaDeEnergiaMagica  
    var resistenciaMagicaGremio

    // punto 1 
    method initialize(miembrosIniciales) {
        if(miembrosIniciales < 2) {
            self.error("No cumple la condicion de al menos dos integrantes en un gremio")
        }
    }

    method resistenciaMagicaGremio() = resistenciaMagicaGremio

    method poderTotalGremio() = miembros.map({miembro => miembro.poderTotal()}).sum()

    method reservaDeEnergiaMagica() = miembros.map({miembro => miembro.puntosDeEnergiaMagica()}).sum()

    method lider() = miembros.map({miembro => miembro.poderTotal()}).max() // no se si esta biem 
        
    method desafiar(oponente) {
        oponente.serDesafiadoPor()
    } 

    method serDesafiadoPor(gremioAtacante) {
        if(gremioAtacante.poderTotalGremio() > self.resistenciaMagicaGremio()) {
            const puntosGanados = self.puntos(gremioAtacante)
            gremioAtacante.lider().reservaDeEnergiaMagica() + puntosGanados 
        }
    }

    method puntos(atacante) {
        return miembros.map({miembro => miembro.puntosPerdidos(atacante)}).sum()
    }



}