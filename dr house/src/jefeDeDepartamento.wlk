class jefeDeDepartamento {
  var subordinado = #{}

  method atenderAalguien () {
    self.unSubordinado().atenderAalguien()
  }

  method unSubordinado () {
    return subordinado.anyOne() 
  }
}
