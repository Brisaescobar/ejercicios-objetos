import src.enfermedad.*

class Persona {

  var temperatura = 0
  var celulas = 0
  const enfermedades = #{}

  method temperatura() = temperatura

  method agregarEnfermedad(unaEnfermedad) {
    enfermedades.add(unaEnfermedad)
  }

  method celulas() = celulas

  method destruirCelulas(unValor) {
    celulas -= unValor 
  }
  method modificarTemperatura(unValor) {
    temperatura = (unValor + temperatura).min(45)
  }

  method diezPorcientoDeCelulasTotales() = self.celulas() * 0.1 

  method contraerEnfermedad(enfermedad) {
    self.agregarEnfermedad(enfermedad)
  }

  method reproducirEnfermedad(enfermedad) {
    enfermedades.filter(enfermedad)
  }

  method cantidadDeCelulasAfectadasPorEnfermedadesAgresivas() = enfermedades.filter({enfermedad => enfermedad.esAgresiva(self)}).sum( {enfermedad => enfermedad.celulasAmenazadas()} )
  //funciono, en principio no hay enfermedades agresivas

  method enfermedadMasCelulasAmenazadas() = enfermedades.max( {enfermedad => enfermedad.celulasAmenazadas()} )

  method estaEnComa() = self.temperatura() == 45 or self.celulas() < 1000000

  method vivirUnDia() {
    enfermedades.forEach( {enfermedad => enfermedad.afectar(self)} )
  }

  method pasar31Dias() {
    31.times({n => self.vivirUnDia()}) 
  }

  //const miApply = {logan.vivirUnDia()} 
}

const logan = new Persona(enfermedades = #{malaria500, lupus, otitis}, temperatura = 36, celulas = 3000000)
const frank = new Persona(temperatura = 36, celulas = 3500000)


