import otrosObjetos.contento.contento
import otrosObjetos.hambriento.hambriento
import otrosObjetos.triste.triste

object tamagotchi {
    var nivelDeFelicidad = 0
    var estado = contento
    var contador = 0 

    method comer () {
       self.cambiarContador(1)
       self.comioTriste()
       self.comioContento()
    }

    method poneteContento () {
        self.estado(contento)
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

    method juega () {
        if(estado.equals(triste)){
            self.cambiarEstado(contento)
        }
    }
}

