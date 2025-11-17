import src.EmocionesDeRiley.*
import src.Recuerdos.*

class Ryley {
    var nivelDeFelicidad = 1000
    var emocionActual = Alegria
    var recuerdosDelDia = []
    var pensamientosCentrales = #{}
    var pensaminetoActual = null
    var memoriaALargoPlazo = []
    var edad = 11


    method nivelDeFelicidad() = nivelDeFelicidad

    method disminuirNivelDeFelicidad(unaCantidad) {
        nivelDeFelicidad -= unaCantidad
    }

    method restaurarNivelDeFelicidad () {
        if(nivelDeFelicidad <= 1000) {
            nivelDeFelicidad += 100
        }
    }

// punto 1
    method vivirEvento(descripcion, fecha){
       self.agregarARecuerdoDelDia(descripcion, fecha)
      
    }

    method agregarARecuerdoDelDia(descripcion, fecha) {
       const unRecuerdo = new Recuerdo()
        recuerdosDelDia.add(unRecuerdo)
    }

// punto 2
    method asentar(unRecuerdo) {
       // no se como plantearlo porque ya estan en las emociones
    }

// punto 3
    method recuerdosRecientesDelDia() {
        return recuerdosDelDia.take(5) 
        //take me devuelve los n elementos
    }

// punto 4 

    method pensamientosCentrales() = pensamientosCentrales

// punto 5

    method pensamientosCentralesDificilesDeExplicar() {
        pensamientosCentrales.words().size() > 10
    }

 // punto 6 
    method negar(unRecuerdo) {
        return emocionActual.negar(unRecuerdo)
    }

// punto 7
    method dormir() {
        self.asentarTodosLosRecuerdos()
        self.asentaminetoSelectivo() 
        //self.profundizar()
        //self.controlHormonal()
        self.restauracionCognitiva()
        self.liberarRecuerdosDelDia()
    }

    method asentarTodosLosRecuerdos() {
        recuerdosDelDia.forEach({recuerdo => recuerdo.asentar()})
    }

    method asentaminetoSelectivo() {
        var clave 
        if(recuerdosDelDia.descripcion().contains(clave)){
            recuerdosDelDia.asentar()
        }
    }

// REVISAR
/*
    method profundizar() {  
       if(noEsRecuerdoCental() and not negar()){
            self.enviarAMemoriaLargoPlazo()
       }
    }

   method noEsRecuerdoCentral() {
    return recuerdosDelDia.forEach({recuerdo => recuerdo not recuerdosDelDia.pensamientosCentrales().contains(recuerdosDelDia)})
   }

   method enviarAMemoriaLargoPlazo() {
    memoriaALargoPlazo.add().noEsRecuerdoCentral()
   }

// otro para revisar 
    method controlHormonal() {
        if(estaUnPensamientoCentralEnMemoria() || todosLosRecuerdosMismaEmocion()) {
            self.desequilibrioHormonal()
        }
    }
*/
    method estaUnPensamientoCentralEnMemoria(){
        return pensamientosCentrales.any({unPensamiento => memoriaALargoPlazo.contains(unPensamiento)})
    }

    method todosLosRecuerdosMismaEmocionDominante() {
        return recuerdosDelDia.all({recuerdo => recuerdo.emocionDominante() == recuerdosDelDia.first().emocionDominante()})
    }

    method desequilibrioHormonal() {
        self.disminuirNivelDeFelicidad(nivelDeFelicidad * 0.15)
        self.perderTresPensamientosCentrales()
    }

    method perderTresPensamientosCentrales() {
        return pensamientosCentrales.drop(3)
        // me devuelve la lista sin primeros n elementos
    }

    method restauracionCognitiva() {
        self.restaurarNivelDeFelicidad()
    }

    method liberarRecuerdosDelDia() {
        recuerdosDelDia.clear()
        // elimina todos los elementos
    }

// punto 8 
    method rememorar() {
        self.traerRecuerdoYQueSeaPensaminetoActual()
    }

    method traerRecuerdoYQueSeaPensaminetoActual() {
        var recuerdosAntiguos
        recuerdosAntiguos = memoriaALargoPlazo.anyOne({unRecuerdo => unRecuerdo.fecha().year() < edad / 2})
        recuerdosAntiguos = pensaminetoActual    
    }

// punto 9
    method repetirRecuerdo(unRecuerdo) {
        return memoriaALargoPlazo.count({recuerdo => recuerdo == unRecuerdo})
        // cuento los recuerdos iguales a un recuerdo
    }

// punto 10 
    method tenerDejaVu(unRecuerdo) {
        pensaminetoActual != null &&
        self.repetirRecuerdo(unRecuerdo) > 1
    }
}