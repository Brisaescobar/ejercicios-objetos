import src.empleado.*
object limpiarSector {
    var dificultad = 0
    var amenaza = 0

    method limpiarSector(unEmpleado) {
        if(unEmpleado.rol() != "Mucama" and unEmpleado.estamina() > 4) {
            unEmpleado.realizarTarea(unEmpleado)
        }
    }

    method realizarTarea(unEmpleado) {
        unEmpleado.perderEstamina(0)
    }
    // no se cuanta estamina pierde 
}