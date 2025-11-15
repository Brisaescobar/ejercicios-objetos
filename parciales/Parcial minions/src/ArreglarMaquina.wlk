import src.empleado.*
object arreglarMaquina {
    var complejidad = 0 
    var herramientaNecesaria = [] //lista de herramientas

    method complejidad() = complejidad

    method arreglarMaquina(unEmpleado){
        if(unEmpleado.tieneLaEstaminaNecesaria() and unEmpleado.tieneLasHerramientasNecesarias()){
            unEmpleado.realizarTarea()
        }
        else if (unEmpleado.tieneLaEstaminaNecesaria(unEmpleado)){
            unEmpleado.realizarTarea()
        } // no se como hacer si la maquina no necesita ninguna herramienta
    }

    method tieneLaEstaminaNecesaria(unEmpleado) {
        unEmpleado.estamina() > self.complejidad()
    }

    method tieneLasHerramientasNecesarias(unEmpleado) {
        unEmpleado.cinturon().contains(herramientaNecesaria)
    }

    method realizarTarea(unEmpleado) {
        unEmpleado.perderEstamina(complejidad)
    }
}