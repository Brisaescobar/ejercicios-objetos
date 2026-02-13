// https://docs.google.com/document/d/11XMvYJKG_k45YB83S9_5jjwa2Zl7XbMAoMmr518ahk4/edit?tab=t.0
class Lenguaje {
    const antiguo 

    method esViejo() = antiguo

    method esModerno() = !self.esViejo()
}

const wollokk = new Lenguaje(antiguo = false)

class Invitado {
    const lenguajes = []
    var property mesa = 0

    method estaInvitado() = false // ¿?

    method esCopado() = false

    method sabeLenguajeAntiguo() = lenguajes.any({lenguaje => lenguaje.esViejo()})

    method sabeLenguajeModerno() = lenguajes.any({lenguaje => lenguaje.esModerno()})
    
    method cantidadDeLenguajes() = lenguajes.size()  

    method aprenderLenguaje(unLenguaje) = lenguajes.add(unLenguaje)
    
    method cantidadLenguajesModernosQueSabe() = lenguajes.count({lenguaje => lenguaje.esModerno()})
    
    method irAMesa() {
        mesa = self.cantidadDeLenguajes() 
    }

    method regalarDinero() = 1000 * self.cantidadLenguajesModernosQueSabe()
}

class Desarrolladores inherits Invitado {
    override method estaInvitado() = lenguajes.contains(wollokk) || self.sabeLenguajeAntiguo()

    override method esCopado() = self.sabeLenguajeAntiguo() && self.sabeLenguajeModerno()
}

class Infraestructura inherits Invitado {
    const property experiencia = 0

    override method esCopado() = self.tieneMuchaExperiencia() 

    override method estaInvitado() = self.cantidadDeLenguajes() > 5

    method tieneMuchaExperiencia() = self.experiencia() > 10
}

class Jefes inherits Invitado {
    const property empleados = #{}

    method tomarACargo(unEmpleado) {
        empleados.add(unEmpleado)
    }

    method cantidadDeEmpleados() = self.empleados().size()

    override method estaInvitado() = self.sabeLenguajeAntiguo() && self.tieneGenteCopada()

    method tieneGenteCopada() = empleados.all({empleado => empleado.esCopado()})

    override method irAMesa() {
        mesa = 99 
    }

    override method regalarDinero() = super() + self.cantidadDeEmpleados() * 1000
}

class JuanPerez {
    const compañeros = #{}

    method listaDeInvitados() = compañeros.filter({compañero => compañero.estaInvitado()})
}

class Fiesta {
    const invitados = #{}
    var property asistentes = []
    const costo = 2000000 // 5 por persona
    var property balanceRegalos = 0
    var property balanceTotal = 0  

    method costoTotal() = costo + (asistentes.size() * 5000)

    method registarAsistencia(persona) {
        self.verificarInvitacion(persona)
        self.agregarRegistroDeAsistencia(persona)
    }
    
    method verificarInvitacion(persona) {
        if(persona.estaInvitado()){
            self.agregarRegistroDeAsistencia(persona)
        }
        else {
            self.error("La persona no esta invitada :(")
        }
    }

    method esAsistente(unInvitado){
        return asistentes.contains(unInvitado)
    }

    method agregarRegistroDeAsistencia(persona){
        asistentes.add(persona) 
        persona.irAMesa()
    }

    method balanceFiesta() {
        balanceTotal = balanceRegalos - self.costoTotal()
    }

    method recibirRegalo(unInvitado){
        balanceRegalos += unInvitado.regalarEfectivo()
    }

    method fueExitosa() = balanceTotal > 0 || self.asistieronTodosLosInvitados()

    method asistieronTodosLosInvitados() = invitados.size() == asistentes.size()
}

