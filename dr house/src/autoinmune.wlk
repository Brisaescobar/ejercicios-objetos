import ejercicios-objetos.dr house.src.temporada1.*
class Autoinmune {
    var diasAfectado
    method disminuirCelulas (Paciente) {
      Paciente.disminuirCelulas(celulasAmenazadas)
      diasAfectado += 1
    }

    method esAgresiva (Paciente) {
      return diasAfectado > 30
    }
}