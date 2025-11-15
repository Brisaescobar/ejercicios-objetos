object pepita {
  var energy = 100
  var lugar = principio

  method lugar() = lugar 

  method lugar(lugares) {
    lugar = lugares
  }

  method energy() = energy

  method vuela(kilometros) {
    energy -= 10 + kilometros
  }

  method comer(gramos) {
    energy =+ 4 * gramos
  }

  method ir(lugares) {
    self.vuela(lugares.distanciaDesdeInicio())
    self.lugar(lugares)
  }

  method puedeIr(esta, voy) = ruta9.calculoDiferencia(esta, voy) +10 <= energy
}

object principio {
  const distanciaDesdeInicio = 0

  method distanciaDesdeInicio() = distanciaDesdeInicio 
}

object villaLaÑata {
  const distanciaDesdeInicio = 10

  method distanciaDesdeInicio() = distanciaDesdeInicio  
}

object ruta9 {
  const lugar0 = principio
  const lugar1 = villaLaÑata

  method lugar0() = lugar0
  method lugar1() = lugar1
  method calculoDiferencia(inicio, fin) = fin.distanciaDesdeInicio() - inicio.distanciaDesdeInicio()   
}