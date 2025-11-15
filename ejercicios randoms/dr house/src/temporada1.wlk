import temporada2.Medico
import autoinmune.enfermedadAutoinmune
import infecciosa.enfermedadInfecciosa

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
        enfermedades.forEach({enfermedad => enfermedad.atenuarse(dosis * 15)})
        enfermedades.filter({enfermedad => enfermedad.estaCurado})
    }

    method estaCurado (enfermedadesCuradas) {
        enfermedades.removesuchall(enfermedadesCuradas)
    }

}

// describe 
// que hace 
// assert equals 
