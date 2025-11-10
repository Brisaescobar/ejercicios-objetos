class Expedicion {
  
    const vikingos = #{}
    const cantidadMinima = true

    method subirAExpedicion(unVikingo) {
      vikingos.add(unVikingo)
    }
    method esApto(vikingo) {
      return vikingo.puedeIrAExpedicion()
    }

    method puedeSubirAExpedicion(vikingo) {
        if(self.esApto(vikingo)){
            self.subirAExpedicion(vikingo)
        }else{
            self.error("No puede ir a Expedicion")
        }
    }

    method cantidadDeVikingos() = vikingos.size() 

    method valeLaPenaEn(unaAldea, unaCapital) {
      return unaAldea.valeLaPena(self) && unaCapital.valeLaPena(self)
    }

    method tieneCantidadMinima() = cantidadMinima 

    method suBotin(objetivo) = objetivo.botin() 

    method botinPorVikingo(unaAldea, unaCapital) {
      return self.suBotin(unaAldea) + self.suBotin(unaCapital) / self.cantidadDeVikingos()
    }

    method realizarExpedicion(unaAldea, unaCapital) {// deberia agregar las kills tambien una por vikingo en cada capital
      if(self.valeLaPenaEn(unaAldea, unaCapital)){
        self.repartirBotin(vikingos, self.botinPorVikingo(unaAldea, unaCapital))
        self.aumentarKillsDeVikingos(vikingos)
      }
    }

    method repartirBotin(unosVikingos, elBotin) {
      unosVikingos.forEach({vikingo => vikingo.agregarBotin(elBotin)})
    }

    method aumentarKillsDeVikingos(losVikingos) {
      losVikingos.forEach({vikingo => vikingo.aumentarKills(1)})
    }
}