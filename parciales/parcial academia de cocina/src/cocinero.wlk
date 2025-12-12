import src.comida.*
import src.receta.*

class Cocinero {
    var preparaciones = [] 
    var experiencia 
    var nivel = Principiante

    // punto 1 

   method puedePreparar(unCocinero, unaComida) {}

   method nivel() = nivel

   method existeAlgunaSimilar(unaReceta) {
    preparaciones.any({comida => comida.sonSimilares(comida.receta(), unaReceta)})
   }

   method sonSimilares(unaReceta, otraReceta) {
    unaReceta.ingredientes() == otraReceta.ingredientes() ||
    (unaReceta.nivelDeDificultad() - otraReceta.nivelDeDificultad()).abs() <= 1
   }

   method cantidadDeRecetasSimilares(unaReceta) {
    preparaciones.count({comida => comida.sonSimilares(comida.receta(), unaReceta)})
   }
   
   method cantidadDeComidasDificiles() {
    preparaciones.count({comida => comida.receta().esDificil()})
   }

   method preparar(unaReceta) {
    if(nivel.puedePreparar(self, unaReceta)){
        preparaciones.add(unaReceta).subirDeNivel(self)
    }
   }
}

// niveles de cocinero 
class Principiante inherits Cocinero {

    override method puedePreparar(unCocinero, unaComida) {
        not (unaComida.esDificil())
    }

    // punto 3 
    method calidadPara(unCocinero, unaReceta) {
        if(unaReceta.cantidadDeIngredientes() < 4) {
            return "Normal"
        }
        return "Pobre"
    }

    method subirDeNivel(unCocinero) {
        if(unCocinero.experiencia() > 100) {
            unCocinero.nivel() == Experimentado
        } // no va == porque es equivalencia y yo quiero que se asigne
    }
}

class Experimentado inherits Cocinero {
    override method puedePreparar(unCocinero, unaComida) {
        not (unaComida.esDificil()) || unCocinero.existeAlgunaSimilar(unaComida)
    }

    // punto 3 
    method calidadPara(unCocinero, unaReceta) {
        if(unCocinero.perfeccionoReceta()) {
            var plus = unCocinero.cantidadDeRecetasSimilares(unaReceta) /  10 
            return "Superior"
        }
        return "Normal"   
    }

    method subirDeNivel(unCocinero) {
        if(unCocinero.cantidadDeComidasDificiles() > 5) {
            unCocinero.nivel() == Chef
        } // no va == porque es equivalencia y yo quiero que se asigne
    }   
}

class Chef inherits Cocinero {
    override method puedePreparar(unCocinero, unaComida) = true

    // punto 3 
    method calidadPara(unCocinero, unaReceta) {
        if(unCocinero.perfeccionoReceta()) {
            var plus = unCocinero.cantidadDeRecetasSimilares(unaReceta) / 10
            return "Superior"
        }
        return "Normal"
    }

    method subirDeNivel(unCocinero) {}
}
