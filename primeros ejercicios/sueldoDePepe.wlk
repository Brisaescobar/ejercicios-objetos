object pepe {

  var categoria = cadete
  var faltas = 0


  method faltas() = faltas 
  method faltas(cantidad) {
    faltas = cantidad
  }
  method categoria() = categoria 
  method categoria(unaCategoria) {
    categoria = unaCategoria
  }
  method sueldo() = categoria.neto() + bonoPorPresentismo.bono(faltas) + bonoPorResultados.nada() 


}

object  cadete {
  const neto = 1500

  method neto() = neto    

}

object gerente {
  const neto = 1000

  method neto() = neto 

}

object bonoPorPresentismo {
  const bono1 = 100
  const bono2 = 50
  const bono3 = 0


  method bono1() = bono1
  method bono2() = bono2 
  method bono3() = bono3 


  method bono(faltas) = if (faltas == 0) self.bono1() else if(faltas == 1) self.bono2() else self.bono3()
    
  
  method nulo() = 0 
    //podria poner bonoPorPresentismo.nulo() cuando dice en cualquier otro caso y daria lo mismo
}

object bonoPorResultados {
  
  const bono2 = 80
  var bono1 = 0
  const nada = 0

  method bono2() = bono2
  method bono1() = bono1
  method nada () = nada  

  method neto (neto) {
    bono1 = neto * 0.1
  }  

  method fijo() = self.bono2()
  
   
}