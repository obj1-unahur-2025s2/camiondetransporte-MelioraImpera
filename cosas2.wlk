object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method cantidadDeBultos() = 1
    method efectoDeLaCarga() {
        // no hace nada
    }
}

object bumblebee {
    var estaModoAuto = false

    method cambiarModo() {
        estaModoAuto = not estaModoAuto
    }
    method peso() = 800
    method peligrosidad() = if(estaModoAuto) 15 else 30
    method cantidadDeBultos() = 2
    method efectoDeLaCarga() {
        self.cambiarModo()
    }
    method estaModoAuto() = estaModoAuto
}

object paqueteDeLadrillos {
    var property cantidadLadrillos = 0
 
    method peso() = cantidadLadrillos * 2
    method peligrosidad() = 2
    method cantidadDeBultos() = if(cantidadLadrillos.between(1, 100)) 1 else if(cantidadLadrillos.between(101, 300)) 2 else 3
    method efectoDeLaCarga() {
        cantidadLadrillos += 12
    }
}

object arenaAGranel {
    var property peso = 0

    method peligrosidad() = 1
    method cantidadDeBultos() = 1
    method efectoDeLaCarga() {
        peso = 0.max(peso - 10)
    }
}

object bateriaAntiaerea {
    var estaConMisiles = false

    method cargarMisiles() {
        estaConMisiles = true
    }

    method peso() = if(estaConMisiles) 300 else 200
    method peligrosidad() = if(estaConMisiles) 100 else 0
    method cantidadDeBultos() = if(estaConMisiles) 2 else 1
    method efectoDeLaCarga() {
        self.cargarMisiles()
    }
    method estaConMisiles() = estaConMisiles
}

object contenedorPortuario {
    const property cosas = []

    method peso() = 100 + cosas.sum({e => e.peso()})
    method peligrosidad() = if(cosas.isEmpty()) 0 else cosas.max({e => e.peligrosidad()}).peligrosidad() //si no le indico peligrosidad solo me trae el objeto
    method agregarCosa(unaCosa) {
        cosas.add(unaCosa)
    }
    method quitarCosa(unaCosa) {
        cosas.remove(unaCosa)
    }
    method cantidadDeBultos() = 1 + cosas.sum({e => e.cantidadDeBultos()}) //el 1 es por el contenedor
    
    method efectoDeLaCarga() {
        cosas.forEach({e => e.efectoDeLaCarga()})
    }
}

object residuosRadioactivos {
    var property peso = 0

    method peligrosidad() = 200
    method cantidadDeBultos() = 1
    method efectoDeLaCarga() {
        peso += 15
    }
}

object embalajeDeSeguridad {
    var property objetoEmbalado = bumblebee

    method peso() = objetoEmbalado.peso()
    method peligrosidad() = objetoEmbalado.peligrosidad() / 2 
    method cantidadDeBultos() = 2
    method efectoDeLaCarga() {
        // no hace nada
    }
}




