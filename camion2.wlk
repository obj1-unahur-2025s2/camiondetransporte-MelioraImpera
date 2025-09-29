object camion {
    const property carga = []
    var bultos = 0

    method cargar(elemento) {
        carga.add(elemento)
        elemento.efectoDeLaCarga()
        bultos += elemento.cantidadDeBultos()
    }

    method descargar(elemento) {
        carga.remove(elemento)
    }
    method pesoTotal() = 1000 + carga.sum({e => e.peso()})

    method losPesosSonPares() = carga.all({e => e.peso().even()}) //even indica si es par, odd impar

    method hayElementoConPeso(unPeso) = carga.any({e => e.peso() == unPeso})

    method hayElementoConPeligrosidad(unNivel) = carga.any({e => e.peligrosidad() == unNivel})

    method elementosQueSuperanPeligrosidad(unNivel) = carga.filter({e => e.peligrosidad() > unNivel})

    method elementosQueSuperanPeligrosidadDe(elemento) = carga.filter({e => e.peligrosidad() > elemento.peligrosidad()})

    method estaExedido() = self.pesoTotal() > 2500

    method puedeCircularEnRuta(unNivel) = not self.estaExedido() and self.elementosQueSuperanPeligrosidad(unNivel).isEmpty()

    method hayElementoQuePesaEntre(unValor, otroValor) = carga.any({e => e.peso().between(unValor, otroValor)}) //between incluye los valores extremos
    method cosaMasPesada() = carga.max({e => e.peso()}) //me devuelve el objeto que pesa mas
    
    method cantidadDeBultos() = bultos
}

//Prueba de commit

