import src.Emocion.*
import src.Recuerdos.*

class Alegria inherits Emocion {
    override method esAlegre() = true

    override method negar(unRecuerdo) {
       return unRecuerdo.emocionDomininate() != Alegria
    }

    override method asentar(unRecuerdo, riley) {
        if(riley.nivelDeFelicidad(500)){
            unRecuerdo.serPensamientoCentral()
        }
    }
}

class Tristeza inherits Emocion {
    override method esAlegre() = false

    override method negar(unRecuerdo) {
        return unRecuerdo.emocionDominante() == Alegria
    }

    override method asentar(unRecuerdo, riley) {
        unRecuerdo.serPensamientoCentral() and riley.disminuirNivelDeFelicidad(riley.nivelDeFelicidad() * 0.10)
        if(riley.nivelDeFelicidad() < -1){
            self.error ("El nivel de Felicidad de riley esta por subsuelo marta")
        }
    }
}

class EmocionesMixtas inherits Emocion {
    var emociones = [] 

    override method esAlegre() {
        return emociones.any({unaEmocion => unaEmocion.esAlegre()})
    }

    override method negar(unRecuerdo) {
        return emociones.all({unaEmocion => unaEmocion.negar(unRecuerdo)})
    }

    override method asentar(unRecuerdo, riley) {
        emociones.forEach({unaEmocion => unaEmocion.asentar(unRecuerdo, riley)})
    }
}