class Aldea {

    const cantidadTotalDeCrusifijos = 0

    method botin() = cantidadTotalDeCrusifijos 

    method saciaLaSed() = cantidadTotalDeCrusifijos >= 15

    method valeLaPena(unaExpedicion) {
      return self.saciaLaSed() || self.saciaLaSedAmurallada(unaExpedicion)
    }

    method saciaLaSedAmurallada(unaExpedicion) {
      return self.saciaLaSed() && unaExpedicion.tieneCantidadMinima()
    }



}