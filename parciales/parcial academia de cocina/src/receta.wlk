class Receta {
    var ingredientes = []
    var property nivelDeDificultad 
    
    method cantidadDeIngredientes() = ingredientes.size()

    method esDificil() {
        return nivelDeDificultad > 5 || ingredientes.size() > 10
    }

    method experiencia() {
       ingredientes.size() * nivelDeDificultad
    }
}

// punto 4 
class RecetaGourmet inherits Receta {
    override method esDificil() = true

    override method experiencia() {
       2 * (ingredientes.size() * nivelDeDificultad)
    }
}