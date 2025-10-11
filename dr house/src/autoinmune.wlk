import src.temporada1.Paciente
import src.temporada2.Medico

class enfermedadAutoinmune {
    var diasAfectado
    method disminuirCelulas (Paciente) {
      Paciente.disminuirCelulas(celulasAmenazadas)
      diasAfectado += 1
    }

    method esAgresiva (Paciente) {
      return diasAfectado > 3
    }

    
}