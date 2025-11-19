class Inmobiliaria {
    const empleados = #{}

    method mejorEmpleadoSegunCriterio(criterio) {
        empleados.max({ unEmpleado => criterio.sobre(unEmpleado)})
    }
}