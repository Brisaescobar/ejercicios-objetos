class Academia {
    const estudiantes = #{}
    const recetario = #{}
    
    method recetario() = recetario
    
    method entrenarEstudiantes(unosEstudiantes){
        unosEstudiantes.forEach({estudiante => estudiante.prepararRecetaMasDificil()})
    }
}