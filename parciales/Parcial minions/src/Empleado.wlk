import src.Obrero.*
class Empleado {
    var estamina
    var rol 
    var raza
    var fuerza
    var practica

    method estamina() = estamina

    method realizarTarea() {}

    method comerUnaFruta() {}

    method perderEstamina(unaCantidad) {
        estamina -= unaCantidad
    }

    method hacerCuqluierTarea(unEmpleado){
        if(unEmpleado.puedeHacerLaTarea()){
            unEmpleado.realizarTarea()
        }
        else {
            self.error("El empleado no puede realizar la tarea")
        }
    }

    method puedeHacerLaTarea(unEmpleado) {
        unEmpleado.forEach({empleado => empleado.realizarTarea()})
    }

    method recuperarEstamina(unaCantidad) {
       estamina += unaCantidad
    }

    // si hago if para caso es muy algotirmico y no me gusta 
    // creo que deberian ser WKO pero idk

// puse la varaible practica pero se que no tendria que estar 

    method fuerza() {
    var base = (estamina / 2) + 2 
        if (rol == "soldado") {
            base = base + practica
        }
            else if(raza == "ciclope") {
                base = (base + practica) / 2
            }
        return base
    }
}

// ----------------------------------------------------------------

// tienen dos ojos dato no menor
class Biclopes inherits Empleado {
   // tiene limite su estamina -> 10
}

 // tinen un ojo 
class Ciclopes inherits Empleado {
    // nose xd
}
