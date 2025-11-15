import src.contento.contento

object triste {

   method come(unTamagotchi) {
   if(unTamagotchi.comioTresVeces()){
    unTamagotchi.cambiarSuEstado(contento) 
    unTamagotchi.reinicioContador()
   } 
 }
}