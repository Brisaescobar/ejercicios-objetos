import panelista.*
class Tematica {

    const titulo

    method titulo() = titulo

     method palabrasDelTitulo() { 
        self.cantidadDePalabras(self.titulo())
    }

    method cantidadDePalabras(unTitulo) {
        unTitulo.words().size()
    }

    method esInteresante() = false

    method recibirUnaOpinionDe(unPanelista) {
        unPanelista.opinarSinSaberDelTema()
    }
}