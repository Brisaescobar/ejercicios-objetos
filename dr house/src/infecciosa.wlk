import temporada1.Paciente
import temporada2.Medico

class enfermedadInfecciosa {
    var celulasAmenazadas 

    method reproducirse () {
        celulasAmenazadas = celulasAmenazadas *2
    }

    method esAgresiva (paciente) {
        return celulasAmenazadas * 0.10 < Paciente.celulasTotales
        }

    method aumentarTemperatura () {
        Paciente.aumentarTemperatura (celulasAmenazadas/1000)
    }

    method atenuarse (cantidad) {
        celulasAmenazadas -= cantidad
    }
}
