import otrosObjetos.contento.contento
import otrosObjetos.hambriento.hambriento
import otrosObjetos.triste.triste

object tamagotchi {
    var nivelDeFelicidad = 0
    var estado = contento
    var contador = 0 // veces que comio
    var contadorJuegos = 0

    method comer () {
       self.cambiarContador(1)
       self.comioTriste()
       self.comioContento()
    }

    method poneteContento () {
        self.estado(contento)
        self.setearContador(0)
    }

     method poneteTriste () {
        self.estado(triste)
        self.setearContador(0)
    }

     method poneteHambriento () {
        self.estado(hambriento)
        self.setearContador(0)
    }

    method felicidad () {
        return nivelDeFelicidad
    }

    method aumentarFelicidad (cantidad) {
        if(estado.equals(contento)) {
            nivelDeFelicidad += cantidad
        }
    }

    method estado () {
      return estado
    }

    method estado (unEstado) {
      estado = unEstado
    }

    method contadorDeComida (unvalor) {
        contador += unvalor
    }
    
    method cambiarContador (unValor) {
        contador += unValor
    }
    
    method setearContador (unValor) {
        contador = unValor
    }

    method valorContador () {
      return contador
    }

    method cambiarEstado (unEstado) {
        estado = unEstado
        self.setearContador(0)
    }

    method comioTriste () {
       triste.comer(self)
    }

    method comioHambriento() {
      hambriento.comer(self)
    }

    method comioContento() {
      contento.comer(self)
    }

    method juegos () {
        contadorJuegos += 1
    }

    method vecesQueJugo () {
      return contadorJuegos
    }

// si jugo estando triste se pone contento
    method jugar (unTamagotchi) {
        if(estado.equals(triste)){
            triste.cambiarAContento(self)
        }
    }

    method jugar () {
        self.juegos()
        contento.jugar(self)
        contento.jugoConPelota(self)
        //contento.jugoConPiedra(self)
        //contento.jugoConRaton(self)
    }
} 


