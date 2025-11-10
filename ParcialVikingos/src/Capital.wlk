class Capital {

    const cantidadDeDefensores = 0
    const factorDeRiqueza =  0

    method botin() = cantidadDeDefensores + factorDeRiqueza 

    method valeLaPena(unaExpedicion) {
      return cantidadDeDefensores + factorDeRiqueza >= 3 * unaExpedicion.cantidadDeVikingos() 
    }
}