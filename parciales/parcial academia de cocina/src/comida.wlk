import src.receta.*
import  src.cocinero.*

class Comida {
    var property receta
    var calidad // pobre, normal, superior
    var plus // para sup

    method experienciaAportada() {
        receta.cantidadDeIngredientes() * receta.nivelDeDificultad()
    } // normal

    method experienciaAportada2(maximoPorCalidadPobre) {
        const experienciaBase = receta.experienciaAportada()
        if(calidad == "pobre") {
            return experienciaBase.min(maximoPorCalidadPobre)
        }
        else if(calidad == "normal"){
            return experienciaBase
        }
        else {
            calidad == "superior"
            return experienciaBase + plus
        }
    }
}

 