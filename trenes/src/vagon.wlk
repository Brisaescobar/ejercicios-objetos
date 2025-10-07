class locomotora {
  var peso
  var pesoMaximoQuePuedeArrastrar
  var VelocidadMaxima

  method arrastreUtil() {
    return pesoMaximoQuePuedeArrastrar - peso
  } 
}

class vagones {
  method pesoMaximo() {
    self.pesoMaximo()
  }

  method esLiviano () {
    return self.pesoMaximo() < 2500
  }

  method cantidadDePasajeros() {
    return 0
  }
}

class vagonesPasajeros {
  var anchoUtil 
  var metrosLargo

  method cantidadDePasajeros() {
    if(anchoUtil <= 2.5) {
      return metrosLargo *8
    } else {
      return metrosLargo * 10
    }
  }

  method pesoMaximo() {
    return self.cantidadDePasajeros() * 80
  }
}

class vagonDeCarga {

  var cargaMaxima 

  method pesoMaximo () {
    return self.cargaMaxima() + 160
  }
}

class formacion {
  const locomotora 
  const vagones

  method agregarVagon(unVagon) {
    vagones.add(unVagon) // esta en la guia son para agregar obj
  }

  method agregarLocomotora(unaLocomotora) {
   locomotora.add(unaLocomotora)
  }

  method cantidadDeVagones() {
    return vagones.size()
  }

  method unidades() {
    return locomotora.size() + vagones.size()
  }

  method totalDePasajeros() {
    vagones.sum({vagones => vagones.cantidadDePasajeros()})
  }

  method cantidadDeVagonesLivianos() {
    return vagones.sum({vagones => vagones.esLiviano()}) 
  } 

  method velocidadMaxima() {
    return locomotora.min({locomotora => locomotora.velocidadMaxima()}).velocidadMaxima()
  }

  method pesoTotalMaximoVagones() {
    return vagones.sum({vagones=> vagones.pesoMaximo()})
  }

  method pesoTotalLocomotoras() {
    return locomotora.sum({locomotora => locomotora.peso()})
  }

  method pesoTotal() {
    return self.pesoTotalLocomotoras() + self.pesoTotalMaximoVagones()
  }

  method arrasteUtilTotal() {
    return locomotora.sum({locomotora => locomotora.arrasteUtilTotal()})
  }

  method kilosDeEmpuje() {

  }

  
}
