import panelista.*
import tematicas.*

class Celebridad inherits Panelista {
    var cantidadDeInvolucrados
    
    override method opinarSobreFarandula(unchisme) {
        if(unchisme.estaInvolucrado(self)) {
            self.sumarPuntosEstrella(unchisme * cantidadDeInvolucrados)
        }
        else {
            self.opinarSinSaberDelTema()
        }
    }

    override method darUnRemate(unaTematica) {
        self.sumarPuntosEstrella(3)
    }
}

// ----------------------------------------------------------

class Colorado inherits Panelista {
    var nivelDeGracia = 0 
// 0.2 -> es 1/5
    override method darUnRemate(unaTematica) {
        self.sumarPuntosEstrella(0.2* nivelDeGracia)
        self.aumentarNivelDeGracia(1) 
    }

    method aumentarNivelDeGracia(puntos) {
        nivelDeGracia += puntos
    }
}

// ----------------------------------------------------------

class ColoradoConPeluca inherits Panelista {
    override method darUnRemate(unaTematica) {
        super(unaTematica) //cualquier tematica
        self.sumarPuntosEstrella(1)
    }
}

// ----------------------------------------------------------

class Viejo inherits Panelista {
    override method darUnRemate(unaTematica) {
        self.sumarPuntosEstrella(unaTematica.palabrasDelTitulo())
    }
}

// ----------------------------------------------------------

class Depostista inherits Panelista{
    // en un remate no suman puntos 

    override method opinarSobreDeporte(){
        self.sumarPuntosEstrella(5)
    }
}



