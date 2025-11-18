import src.Noticias.*
import src.Estilos.*

class Periodista {
    var fechaDeIngreso = new Date()
    var preferencias = ["copadas", "sensacionalistas", "vagos", "joseDeZer"]
    var publicaciones = []
    
    method publicar(unaNoticia) {
        if(preferencias == "copadas"){
            return unaNoticia.esCopada()
        }
        else if (preferencias == "sensacionalistas"){
            unaNoticia.ContienePalabrasClave()
        }
        else if (preferencias == "vagos") {
            unaNoticia.Chivo() ||
            unaNoticia.cantidadDePalbrasDelDesarrollo() < 100
        }
        else {
            unaNoticia.elTituloComienzaConT()
        }
    }

    // esto no me gusta muy algoritmico -> podrian ser muchos || (creo)

    method publicarNoticiaNueva(nuevaNoticia) {
        if(not nuevaNoticia.noticiaBienEscrita()) {
            self.error("La noticia no esta bien escrita :( ")
        }
    }

    method noticiaBienEscrita(unaNoticia) {
        unaNoticia.cantidadDePalbarasDelTitulo() >= 2 and 
        unaNoticia.desarrollo() != null  // tiene desarrollo 
    }

    method publicarDosNoticiasQueNoPrefiere() {
     // no se bien marta 
    }

}

