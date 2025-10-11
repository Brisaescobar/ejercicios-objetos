import src.temporada1.Paciente
import src.temporada2.Medico

class enfermedadAutoinmune {
    var diasAfectado
    var celulasAmenazadas
    
    method disminuirCelulas (Paciente) {
      Paciente.disminuirCelulas(celulasAmenazadas)
      diasAfectado += 1
    }

    method esAgresiva (Paciente) {
      return diasAfectado > 3
    }

    method atenuarse (cantidad) {
        celulasAmenazadas -= cantidad
    }
}