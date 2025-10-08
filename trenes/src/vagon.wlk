class Locomotora { // las clases con mayusculas!!
  var peso
  var pesoMaximoQuePuedeArrastrar
  var VelocidadMaxima

  method arrastreUtil() {
    return pesoMaximoQuePuedeArrastrar - peso
  }

  method pesoLocomotora() {
    return peso
  }
}

class Vagones {
  method pesoMaximo() {
    return self.pesoMaximo()
  }

  method esLiviano () {
    return self.pesoMaximo() < 2500
  }

  method cantidadDePasajeros() {
    return 0
  }
}

class VagonesPasajeros {
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

class VagonDeCarga {

  var cargaMaxima 

  method cargaMaxima() {
    return self cargaMaxima
  }

  method pesoMaximo () {
    return self.cargaMaxima() + 160
  }
}

class Formacion {
  var locomotora = []
  var  vagones = []

// punto 1
  method agregarVagon(unVagon) {
    vagones.add(unVagon) // esta en la guia son para agregar obj
  }

// punto 2

  method agregarLocomotora(unaLocomotora) {
   locomotora.add(unaLocomotora)
  }

// punto 3
  method cantidadDeVagones() {
    return vagones.size()
  }

  method unidades() {
    return locomotora.size() + vagones.size()
  }

// punto 4
  method totalDePasajeros() {
    vagones.sum({vagones => vagones.cantidadDePasajeros()})
  }

// punto 5
  method cantidadDeVagonesLivianos() {
    return vagones.sum({vagones => vagones.esLiviano()}) 
  } 

// punto 6
  method velocidadMaxima() {
    return locomotora.min({locomotora => locomotora.velocidadMaxima()}).velocidadMaxima()
  }

// punto 7 
  method esEficiente() {
    return locomotora.forall({ unaLocomotora =>
        unaLocomotora.arrastreUtil() >= unaLocomotora.pesoLocomotora() * 5
    })
}
 
  method arrasteUtilTotal() {
    return locomotora.sum({locomotora => locomotora.arrasteUtilTotal()})
  }

// punto 8 
  method puedeMoverse() {
    return self.arrasteUtilTotal() >= self.pesoTotalMaximoVagones()
  }

// punto 9 
  method kilosDeEmpuje() {
    return self.pesoTotalMaximoVagones() - self.arrasteUtilTotal()
  }

// condiciones para el punto 11 
method esCompleja() {
  return self.unidades() >=20 or self.pesoTotal() > 10000
}

method pesoTotalMaximoVagones() {
    return vagones.sum({vagones => vagones.pesoMaximo()})
  }

method pesoTotalLocomotoras() {
    return locomotora.sum({locomotora => locomotora.peso()})
  }

method pesoTotal() {
    return self.pesoTotalLocomotoras() + self.pesoTotalMaximoVagones()
  }

}

class Deposito {
  var formaciones
  var locomotorasSueltas

// punto 10
  method vagonPesado() {
    return formaciones.map({formacion => formacion.vagonPesado()})
  }
// punto 11
method necesitaConductorExperimentado() {
  return formaciones.any({formacion => Formacion.esCompleja()})
}

// punto 12 
method agregarLocomotoraParaQueSeMueva(unaFormacion) {
  if(not unaFormacion.puedeMoverse()){
    const kilosFaltantes = unaFormacion.kilosDeEmpujeFaltantes()
    const locomotoraApta = locomotorasSueltas.find({ locomotora => locomotora.arrastreUtil() >= kilosFaltantes })

    if (locomotoraApta != null) {
      locomotorasSueltas.remove(locomotoraApta)
      unaFormacion.agregarLocomotora(locomotoraApta)
    }
  }
}
}