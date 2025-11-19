class Inmueble {
    const property zona 

    method estaEn(unaZona) {
        return zona == unaZona
    }

    method valor() {
        return zona.precioSegun()
    }

    method puedeVenderse() = true 
}

