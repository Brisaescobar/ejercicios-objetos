import src.Noticias.*

class Comun inherits Noticia {
    var links = [] // -> a otras noticias
    
    override method copadaSegunTipo() {
        return links.size() >= 2
    }
}

class Chivo inherits Noticia {
    var monto 

    override method copadaSegunTipo() {
        return monto > 2000000
    }
}

class Reportaje inherits Noticia {
    var entrevistados 
    
    override method copadaSegunTipo() {
        // return cantidadDePalbarasDelTitulo().odd() -> revisar 
        return titulo.words().size().odd()
    }
}

class Cobertura inherits Noticia {
    var noticiasRelacionadas = []

    override method copadaSegunTipo() {
       return noticiasRelacionadas.all({unaNoticia => unaNoticia.copadaSegunTipo()})
    }
}