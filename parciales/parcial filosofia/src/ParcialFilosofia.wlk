import wollok.mirror.*
// Filosofo 
class Filosofo {
    var dias
    var edad 
    const property nombre 
    var property actividades = []
    var property honorificos = #{}
    var property nivelDeIluminacion 

    // punto 1 
    method presentarse() = self.nombre() + self.honorificos().join()

    //punto 2 
    method estaEnLoCorrecto() = nivelDeIluminacion > 100

    method edad() = edad

    method aumentarNivelDeIluminacion(unaCantidad) = nivelDeIluminacion + unaCantidad
    
    method disminuirNivelDeIluminacion(unaCantidad) = nivelDeIluminacion - unaCantidad

    method agregarHonorifico(unHonorifico) = honorificos.add(unHonorifico)

    method diasDeRejuvenecimiento() = dias 

    method esSuCumpleaños() = dias / 365 == 0

    method rejuvenecer(unosDias) {
        dias -= unosDias
    }

    method envejecer(unosDias) {
        dias += unosDias
    }

    method verificarSuCumple() {
        if(self.esSuCumpleaños()){
            self.aumentarNivelDeIluminacion(10)
            self.verificarJubilacion()
        }
    }

    method verificarJubilacion() {
        if(self.edad() == 60) {
            self.agregarHonorifico("El sabio")
        }
    }

    method realizarActividades() {
        actividades.forEach({actividad => actividad.aplicar(self)})
    }

    // PUNTO 3 
    method vivirUnDia() {
        self.realizarActividades()
        self.envejecer(1)
        self.verificarSuCumple()
    }

}

// podria hacer una clase abs actividad y que tengan los metodos necesarios
// para ser sobreescritos
object tomarVino {
    method aplicar(unFilosofo) {
        unFilosofo.disminuirNivelDeIluminacion(10)
        unFilosofo.agregarHonorifico("El borracho")
    }
}

object juntarseEnElAgora {
    method aplicar(unFilosofo) {
        const otroFilosofo 
        unFilosofo.aumentarNivelDeIluminacion(otroFilosofo.nivelDeIluminacion() / 10)
    }
}

object admirarElPaisaje {
    method aplicar(unFilosofo){}
}

object meditarBajoUnaCascada {
    method aplicar(unFilosofo) {
        const metrosDeCascada 
        unFilosofo.aumentarNivelDeIluminacion(10 * metrosDeCascada)
    }
}


// ACTIVIDADES
class PracticarDeporte {
    const deporte 
    method aplicar(unFilosofo) {
        unFilosofo.rejuvenecer(deporte.diasDeRejuvenecimiento())
    }
}

object futbol {
    method diasDeRejuvenecimiento() = 1
}

object polo {
    method diasDeRejuvenecimiento() = 2 
}

object waterpolo {
  method diasDeRejuvenecimiento() = polo.diasDeRejuvenecimiento() * 2
}

// DISCUSION 
class Discusion {
    const unPartido 
    const otroPartido 

    method esBuena() = unPartido.esBueno() and otroPartido.esBueno()
}

// PARTIDO 
class Partido {
    const filosofo 
    const argumentos 

    method esBueno() = filosofo.estaEnLoCorrecto() && self.tieneBuenosArgumentos()

    method tieneBuenosArgumentos() = self.cantidadDeArgumentosEnriquecedores() > self.cantidadDeArgumentos() / 2 

    method cantidadDeArgumentos() = argumentos.size()

    method cantidadDeArgumentosEnriquecedores() = argumentos.count({argumento => argumento.esEnriquecedor()})
}

// ARGUMENTO 
class Argumento {
    const descripcion 
    const naturaleza 

    // punto 4 
    method esEnriquecedor() = naturaleza.enriquece(self)

    method cantidadDePalabras() = descripcion.words()

    method esPregunta() = descripcion.endsWith("?")
}

// TIPOS DE ARGUMENTOS 
object estoico {
    method enriquece(unArgumento) = true 
}

object moralista {
    method enriquece(unArgumento) = unArgumento.cantidadDePalabras(10)
}

object esceptica {
    method enriquece(unArgumento) = unArgumento.esPregunta()
}

object cinica {
    method enriquece(unArgumento) = 1.randomUpTo(100) <= 30
}

class NaturalezaCombinada {
    const naturalezas 
    method enriquece(unArgumento) = naturalezas.all({naturaleza => naturaleza.enriquece(unArgumento)})
}

// FILOSOFO CONTEMPORANEO
class FilosofoContemportaneo inherits Filosofo {
    var property amaAdmirarElPaisaje = false 
    
    override method presentarse() = "hola"

    override method nivelDeIluminacion() {
        if(self.amaAdmirarElPaisaje()) {
            return super() * 5
        }
        else {
            return super()
        }
    }
}

