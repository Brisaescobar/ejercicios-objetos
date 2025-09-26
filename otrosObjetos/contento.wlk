import tamagotchi

object contento {
    method comer (unTamagotchi) {
        unTamagotchi.aumentarFelicidad(1)
    }
    method jugoConPelota (unTamagotchi) {
      unTamagotchi.aumentarFelicidad(5)
    }

    method jugoConPiedra(unTamagotchi) {
      unTamagotchi.poneteTriste()
    }

    method jugoConRaton(unTamagotchi) {
      unTamagotchi.aumentarFelicidad(3)
      unTamagotchi.poneteHambriento()
    }
    
    method jugar(unTamagotchi) {
        if(unTamagotchi.vecesQueJugo() == 3){
            unTamagotchi.poneteHambriento()
        }
    }
} 