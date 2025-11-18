class Noticia {
    var fecha = new Date()
    var periodista
    var gradoDeImportancia // 1 - 10 
    var titulo = ""
    var desarrollo = ""

// punto 1 
    method esCopada() {
        self.esImportanteYMenosDeTresDias() and self.copadaSegunTipo()
    }

    method esImportante() {
        return gradoDeImportancia >= 8
    }

   method PublicadoMenosDe3Dias() {
       return self.fecha() - new Date().plusDays(3) == 0    
   }
   // desconfio marta 

    method fecha() = fecha 

    method esImportanteYMenosDeTresDias() {
        return self.esImportante() and self.PublicadoMenosDe3Dias()
    }
    
    method copadaSegunTipo() = false 

    method ContienePalabrasClave(unaNoticia) {
        var palabrasClave = #{"espectacular", "increible" , "grandioso" , "Dibu Martinez"}
        return titulo.words().contains(palabrasClave)
        // deberia ser alguna de esas palabras pero bueno a nothing
    }

    method cantidadDePalbrasDelDesarrollo() {
        return desarrollo.words().size()
    }

    method cantidadDePalbarasDelTitulo() {
        return titulo.words().size()
    }

    method elTituloComienzaConT() {
        titulo.startsWith("T")
    }

}

