import src.Inmueble.*

class Casa inherits Inmueble {
    var valorCasa
    override method valor() {
        return super() + valorCasa
    }
}

class PH inherits Inmueble {
   var metrosCuadrados // podria ser const 

    override method valor() {
        return (super() + (14000 * metrosCuadrados) / 500000) . floor()
    } 

}

class departamento inherits Inmueble {
    var cantidadDeAmbientes 

    override method valor() {
        return super() + 350000 * cantidadDeAmbientes
    } 
}

// -------------------------------------------------------------------


class Local inherits Casa{
    const tipo                // puede ser un galpon o a la calle

    override method valor(){
        return super() + tipo.valorSegun(self)
    }

    override method puedeVenderse() = false
}

class Galpon{

    method valorSegun(local){
        return local.valor()
    }
}

class Calle{

    const montoFijo 

    method valorSegun(_calle){ //_ no se usa
        return montoFijo
    }
}


class Zona{
    const valorDeLaZona

    method plus() = valorDeLaZona
}
