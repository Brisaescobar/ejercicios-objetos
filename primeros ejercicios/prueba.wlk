object laika {
    var energia = 100
    const raza = "perro"

    method ladrido () {
      return "guau xd"
    }
    
    method salirAPasear() {
      energia = energia -20
    }

    method raza () {
        return raza
    }
}

object joaco {
    var energia = 100
    const mascota = laika

    method salirAPasear() {
      mascota.salirAPasear()
      energia = energia - 20
    }
}