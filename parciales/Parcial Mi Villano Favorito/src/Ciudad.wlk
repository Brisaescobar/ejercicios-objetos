class Ciudad{
    var temperatura

    const objetos = []

    method disminuirTemperatura(cantidad){
        temperatura -= cantidad
    }

    method perderObjeto(objeto){
        objetos.remove(objeto)
    }
}