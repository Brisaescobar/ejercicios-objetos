import src
class ObjetoMagico {
    method poder(unMago) {}
    // abs porque depende
}

class Varitas {
    override method poder(unMago) {
        if(unMago.nombre.length() / 2 == 0) {
            poderBase * 1.5
        }
        else {
            poderBase
        }
    }
}

class Tunicas {
    override method poder(unMago) {

    }
}

class TunicasEpicas {
    override method poder(unMago) {
        
    }
}

class Amuletos {
    override method poder(unMago) = 200 

}