import 

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
}

