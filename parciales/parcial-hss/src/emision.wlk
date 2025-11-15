import panelista.*
import tematicas.*
class Emision {
    var tematicas = []
    var panelistas = []
    var emitido = false 

    method puedeEmitirse() = self.alMenosDosPanelistas() && self.alMenosLaMitadDeLasTematicasSonInteresantes()
    
    method alMenosDosPanelistas() = panelistas.size() > 2
    

    method alMenosLaMitadDeLasTematicasSonInteresantes() = self.cantidadDeTematicasInteresantes() >= self.cantidadDeTematicas() / 2
    

    method cantidadDeTematicas() = tematicas.size()

    // count cuenta todos los elementos dada una condicion
    method cantidadDeTematicasInteresantes() = tematicas.count({tematica => tematica.esInteresante()})

    method emitirse() {
        panelistas.forEach({panelista => panelista.hablarSobreUnaTematica()})
    }

    method hablarSobreUnaTematica() {
        panelistas.forEach({panelista => panelista.opinarSinSaberDelTema()})
    }

    method panelistaEstrella(){
        self.verificarProgramaEmitido()
        return panelistas.max({panelista => panelista.estrellas()})
    }

    method verificarProgramaEmitido() {
        if(not emitido) {
            self.error("No se puede elegir panelista estrella, porque no se emitio ")
        }
    }
}
