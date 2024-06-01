class Persona {
	const enfermedades = []
	var temperatura = 36
	var property celulas 
	
	method temperatura() = temperatura
	
	method contraer(enfermedad){
		enfermedades.add(enfermedad)
	}
	method destruirCelulas(cantidad){
		celulas = celulas - cantidad
	}
	method pasarUnDia() {
		enfermedades.forEach{e=>e.causaEfecto(self)}
	}
	method aumentarTemperatura(valor) {
 		temperatura += valor
 	}
 	
 	//la cantidad de células que estén amenazadas por enfermedades agresivas.
 	method celulasAmenazadasPorAgresivas() =
 		enfermedades
 		    .filter{e=>e.esAgresiva(self)}
 		    .sum{e=>e.celulasAmenazadas()}
}

class Enfermedad{
	var celulas 
	method celulasAmenazadas() = celulas
	
	method atenuar(cantidad){
		celulas = celulas - cantidad
	}
	
}

class EnfermedadInfecciosa inherits Enfermedad{
	method causaEfecto(persona){
		persona.aumentarTemperatura(celulas/1000)
	}
	method esAgresiva(persona) =
	   celulas > persona.celulas()/10
}

class EnfermedadAutoinmune inherits Enfermedad{
	var dias = 0
	method causaEfecto(persona){
		persona.destruirCelulas(celulas)
		dias += 1
	}
	method esAgresiva(persona) =
	   dias >= 30
}
