import panelista.*
import tematicas.*

class Deportiva inherits Tematica {
    override method recibirUnaOpinionDe(unPanelista) {
        unPanelista.opinarSobreDeporte()
    }

    override method esInteresante() = self.titulo().contains("Messi") 
}

// ----------------------------------------------------------

class Farandula inherits Tematica {
    var celebridadesInvolucradas = []

    override method recibirUnaOpinionDe(unPanelista) {
     unPanelista.opinarSobreFarandula(self.cantidadDeInvolucrados())
    }

    method estaInvolucrado(unaPersona) {
        celebridadesInvolucradas.contains(unaPersona)
    }

    override method esInteresante() = self.cantidadDeInvolucrados() >= 3

    method cantidadDeInvolucrados() = celebridadesInvolucradas.size()

}

// ----------------------------------------------------------

class Filosofica inherits Tematica {
    // no se porque da error voy a llorar 
   // override method esInteresante() = self.palabrasDelTitulo() > 20
}

// ----------------------------------------------------------

class TematicaMixta inherits Tematica {
    var property tematicas = []

    override method titulo() = tematicas.map { tematica => tematica.titulo() }.join(" ")

    // join(" ") es parq que se concatenen con espacios entre palabras

    override method esInteresante() = tematicas.any({tematicas => tematicas.esInteresante()})

    method recibirOpinionDe(unPanelista) {
    tematicas.forEach({tematica => tematica.recibirOpinionDe(unPanelista)})
    }
}



