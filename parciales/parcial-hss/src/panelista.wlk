class Panelista {
    var puntosEstrellas 

    method sumarPuntosEstrella(cantidadDePuntos) {
        puntosEstrellas += puntosEstrellas
    }

    method darUnRemate(unaTematica) {
    
    }

    method opinarSobreFarandula(cantidadDeInvolucrados) {
        self.opinarSinSaberDelTema()
    }
    method opinarSobreDeporte() {
        self.opinarSinSaberDelTema()
    }

    method opinarSinSaberDelTema() {
      self.sumarPuntosEstrella(1)
    }
}