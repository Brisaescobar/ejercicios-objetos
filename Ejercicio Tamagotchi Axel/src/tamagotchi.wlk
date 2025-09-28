import src.contento.contento
import src.triste.triste
import src.hambriento.hambriento

object tamagotchi {
  var estado = contento
  var felicidad = 0
  var contadorDeComidas = 0
   
  method estado() = estado //BIEN

  method estado(unEstado) {//BIEN
    contadorDeComidas = 0
    estado = unEstado
  } 
  //metodos que usan los estados para modificar al tamagotchi
  //method suEstadoEs() = self.estado() //ESTA CAPZ SI NO HACE FALTA

  method cambiarSuEstado(elNuevoEstado) {
    self.estado(elNuevoEstado)
  }

  method felicidad() = felicidad //BIEN
  method felicidad (valor) {
    felicidad += valor
  }

  method aumentarFelicidad(valor) {//BIEN
    self.felicidad(valor)
  }

  method vecesQueComio() = contadorDeComidas //BIEN
  method contadorDeComidas(valor) {// BIEN
    contadorDeComidas += valor
  }
  method setearContadorDeComidas(valor) { //BIEN
    contadorDeComidas = valor
  }
  method reinicioContador() { //BIEN 
    self.setearContadorDeComidas(0) //1)
  }

  method comioTresVeces() = self.vecesQueComio() == 3

  method comer() {
    contadorDeComidas += 1
    estado.come(self) //2) 

  }// los metodos que tienen self por lo general son los que usan otros objetos para enviarle mensajes desde afuera
  //por ejemplo 1)
  // este no 2) porque no lo usa nadie de afuera

}

/*
object triste {
  //const quienEstaTriste = tamagotchi 

 method come(unTamagotchi) {
   if(unTamagotchi.comioTresVeces()){
    unTamagotchi.cambiarSuEstado(contento) 
    unTamagotchi.reinicioContador()
   } 
 }

//  if(unTamagotchi.comioTresVeces()) unTamagotchi.cambiarSuEstado(contento) unTamagotchi.reinicioContador()
//si lo expreso asi toma a 1) como un "else"                                |              1)                 |
//                                                                          2)
//Justo en 2) es donde interpreta que hay un "else"                                                                          
// si pones el mouse sobre 1) ves que no esta dentro del if
}
*/

/*
object contento {

  //var unTamagotchi = tamagotchi

  //method quienEsElTamagotchi() = unTamagotchi 
  //method cambiarQuienEstaAsi(alguien) {
    //unTamagotchi = alguien
  //} 

  //method cambiarDeEstado(algunTamagotchi) {
    //if(algunTamagotchi.suEstadoEs().equals(hambriento)){
      //unTamagotchi.cambiarSuEstado(hambriento)
    //}
    
  //}  

  method come(unTamagotchi) { //BIEN
    unTamagotchi.aumentarFelicidad(1)
  }

  //method aumentarFelicidad(unTamagotchi) {
    //unTamagotchi.aumentarFelicidad(1)
  //}
  
}
*/

/*

object hambriento {
 


  method come(unTamagotchi) {//BIEN
    unTamagotchi.cambiarSuEstado(contento)
    unTamagotchi.reinicioContador()
  }


  
}*/
