import temporada1.Paciente
import autoinmune.enfermedadAutoinmune
import infecciosa.enfermedadInfecciosa

class Medico {
    var dosis
    method atenderPaciente (paciente) {
        paciente.recibirMedicamento(dosis)
    } 
}