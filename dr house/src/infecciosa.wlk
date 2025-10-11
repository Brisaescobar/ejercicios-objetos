

class enfermedadInfecciosa {
    var celulasAmenazadas 

    method reproducirse () {
        celulasAmenazadas = celulasAmenazadas *2
    }

    method esAgresiva () {
        return celulasAmenazadas * 0.10 < Paciente.celulasTotales
    }

    method aumentarTemperatura () {
        Paciente.aumentarTemperatura (celulasAmenazadas/1000)
    }

}
