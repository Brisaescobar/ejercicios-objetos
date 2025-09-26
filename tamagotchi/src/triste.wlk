import tamagotchi

object triste {
  method comer(unTamagotchi) {
   unTamagotchi.valorContador() 
    if (unTamagotchi.valorContador() == 3) {
        unTamagotchi.poneteContento()
    }
  }
} 