import src.noble.*

object castaMedia {
  

  method esEsclavo() = false

  method siguiente() = noble  


  method obtenerBeneficios(unVikingo) {//podria ser un if else nose porque no lo hice asi
    if(not unVikingo.esGranjero()){
      unVikingo.aumentarArmas(10)
      unVikingo.tenerHijos(2)
    }
    if(unVikingo.esGranjero()){
      unVikingo.aumentarHectarias(2)
    }

  } 
}