class Empleado {
    const operacionesConcretadas = #{}
    const reservas = #{}

    method comisiones() {
        return operacionesConcretadas.sum({unaOperacion => unaOperacion.comision()})
    }

    method CantidadDeOperacionesConcretadas() = operacionesConcretadas.size() // son las cerradas 

    method cantidadDeReservas() = reservas.size()

    method tieneProblemasCon(otroEmpleado) {
        return self.cerroOperacionEnMismaZonaQue(otroEmpleado) and self.concretoOperacionDe(otroEmpleado)
    }
    
    method cerroOperacionEnMismaZonaQue(otroEmpleado) {
        return operacionesConcretadas.any({unaOperacion => otroEmpleado.concretoOperacionDe(self)})
    }

    method concretoOperacionDe(OtroEmpleado) {
        return self.concretoOperacionDe(OtroEmpleado) or OtroEmpleado.concretoOperacionDe(self)
    }
    



}