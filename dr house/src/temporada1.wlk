import src.infecciosa.enfermedadInfecciosa
import src.Autoinmune.enfermedadAutoinmune
import src.temporada2.medico

class Paciente {
    var temperatura = 36 
    var celulasTotales = 0
    var enfermedades = []

    method contraerEnfermedad(unaEnfermedad) {
        enfermedades.add(unaEnfermedad)
    }
    
    method vivirUnDia(){
        enfermedades.forEach({enfermedad => enfermedad.producirEfectos(self)})
    }

    method aumentarTemperatura(cantidad){
        temperatura = 45.min(temperatura + cantidad)
    }
    
    method estaEnComa() {
      return temperatura >= 45 or celulasTotales < 1000000
    }

    method disminuirCelulas(cantidad) {
        celulasTotales = celulasTotales - cantidad 
    }

    method recibirMedicamento (dosis) {
        enfermedad.forEach({enfermedad => enfermedad.atenuarse(dosis * 15)})
        enfermedad.filter({enfermedad => enfermedad.estaCurado})
    }

}

// describe 
// que hace 
// assert equals 
