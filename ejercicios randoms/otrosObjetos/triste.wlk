import tamagotchi

object triste {
  method comer(unTamagotchi) { 
    if (unTamagotchi.valorContador() == 3) {
        unTamagotchi.poneteContento()
    }
  }
  method cambiarAContento (unTamagotchi){
    unTamagotchi.ponetecontento()
  }
}