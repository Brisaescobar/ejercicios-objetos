import src.mago.Mago

class ObjetoMagico {
    method poder(unMago) {}
    // abs porque depende del objeto
}

class Varitas inherits ObjetoMagico {
    override method poder(unMago) {
        if(unMago.nombre().length() / 2 == 0) {
            unMago.poderBase() * 1.5
        }
        else {
            unMago.poderBase()
        }
    }
}

class Tunicas inherits ObjetoMagico {
    override method poder(unMago) = 2 * unMago.resistenciaMagica()   
}

class TunicasEpicas inherits ObjetoMagico {
    override method poder(unMago) = 2 * unMago.resistenciaMagica() + 10
}

class Amuletos inherits ObjetoMagico {
    override method poder(unMago) = 200 

}

class Ojota inherits ObjetoMagico {
    override method poder(unMago) = 10 * unMago.nombre().length() 
}