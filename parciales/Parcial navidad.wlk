
class Arbol {
    const regalos = []
    const tarjetas = []
    const adornos = []

    method capacidadRegalos()

    method agregarRegalo(unRegalo) {
        self.verificarCapacidad()
        regalos.add(unRegalo)
    }

    method verificarCapacidad() {
        if(regalos.size() <= self.capacidadRegalos()) {
            self.error("No hay espacio para regalos")
        }
    }

    method beneficiariosDe(coleccion) {
       coleccion.map({elemento => elemento.destinatario()})
    }

    method beneficiarios() = beneficiariosDe(regalos) + beneficiariosDe(tarjetas)

    method beneficiariosRegalo() = beneficiariosDe(regalos)
    
    method beneficiariosTarjeta() = beneficiariosDe(tarjetas)

    method costoTotalEnRegalos() = regalos.sum({regalo => regalo.precio()})

    method importanciaDeAdorno() = adornos.sum({adorno => adorno.importancia()})

    method leQuierenMucho(regalo) = regalo.precio() > self.promedioRegalos()

    method promedioRegalos() = self.costoTotalEnRegalos() / regalos.size()

    method arbolPortentoso() = cantidadDeRegalosQuierenMucho() > 5  || hayTarjetaCara()

    method cantidadDeRegalosQuierenMucho() = regalos.count({regalo => regalo.leQuierenMucho()})

    method hayTarjetaCara() = tarjetas.any({tajeta => tarjeta.valorAdjunto() >= 1000})

    method adornoMasPesado() = adornos.max({adorno => adorno.peso()})
}

// hay dos tipos naturales y artificiales  

class Naturales inherits Arbol{
    const vejez 
    const tamanioTronco 

    override method capacidadRegalos() = vejez * tamanioTronco
}

class Artificiales inherits Arbol {
    var property cantidadVaras 

    override method capacidadRegalos() = cantidadVaras
}

// -----------------------------------------------
class Regalos {
    const property precio 
    const property destinatario 

}

class Tarjeta {
    const property destinatario
    const property valorAdjunto 

}

class Adornos {
    var property peso
    const property pesoBase 
    const property coeficienteDeSuperioridad 

    method importancia() = peso * coeficienteDeSuperioridad
}

class Luces inherits Adornos {
    const property cantidadDeLuces 

    override method importancia() = super() * cantidadDeLuces
}

class FigurasElaboradas inherits Adornos {
    const volumenDeLaFigura 

    override method importancia() = super() + volumenDeLaFigura
}

class Guirnalda inherits Adornos {
    const property aniosDeUso

    override method peso() = pesoBase - 100 * aniosDeUso
}


