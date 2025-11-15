import src.empleado.*
object defenderSector {
    var complejidad = 0
    var sectores = []
    var amenaza = 0

    //dudoso
    method complejidad() = complejidad * 2

    method defenderSector(unEmpleado) {
        if(unEmpleado.rol() == "Mucama"){
            self.error("No puede realizar la tarea defender un sector")
        }
        else(unEmpleado.fuerza() >= amenaza)
    }

    method realizarTarea(unEmpleado) {
        if(unEmpleado.rol() != "Soldado") {
            unEmpleado.perderEstamina((unEmpleado.estamina()/2))
        }
    }
}