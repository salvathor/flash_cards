//
//  FlashCardViewModel.swift
//  MyApp
//
//  Created by Salvador Lopez on 05/11/26.
//

// Foundation: biblioteca básica de Apple (textos, fechas, UUID, etc.).
import Foundation

// COMBINE
// Combine es el framework de Apple para trabajar con datos que CAMBIAN
// con el tiempo. Su idea principal es:
//   - Un "publicador" (Publisher) emite valores cada vez que algo cambia.
//   - Un "suscriptor" (Subscriber) escucha esos valores y reacciona.
//
// En este archivo usamos dos piezas de Combine:
//   1. `ObservableObject`: protocolo que convierte la clase en algo que
//      se puede observar. Combine le agrega automáticamente un publicador
//      llamado `objectWillChange`, que avisa "estoy a punto de cambiar".
//   2. `@Published`: se pone antes de una propiedad. Cada vez que su valor
//      cambia, dispara ese aviso.
//
// ¿Quién escucha? La vista. Al usar `@StateObject` en `FlashCardsView`,
// SwiftUI se suscribe a este ViewModel y redibuja la pantalla en cuanto
// recibe un aviso. Por eso, al llamar `voltear()` o `siguiente()`,
// la tarjeta se actualiza sola sin que escribamos código extra.
//
// Sin `import Combine`, Swift no reconocería `ObservableObject` ni `@Published`.
//
// Nota: en proyectos nuevos, Apple también ofrece el macro `@Observable`
// (framework Observation), que hace lo mismo con menos código. Aquí usamos
// Combine porque es la forma clásica y muy común en proyectos existentes.
import Combine

// VIEWMODEL (Vista-Modelo)
// Es el "intermediario" entre el Modelo (los datos) y la Vista (la pantalla).
// Aquí vive la LÓGICA: qué tarjeta se muestra, si está volteada, cómo
// avanzar a la siguiente, etc. La vista solo lee estos datos y llama funciones.
//
// Usamos una `class` (y no un struct) porque la vista necesita compartir
// siempre el mismo objeto mientras la app está abierta.
//
// `final` significa que ninguna otra clase puede heredar de esta.
//
// `ObservableObject` permite que SwiftUI "observe" este objeto: cuando algo
// marcado con @Published cambia, la vista se vuelve a dibujar sola.
final class FlashCardsViewModel: ObservableObject {

    // Lista de todas las tarjetas. Es `let` porque no cambia después de crearse.
    let tarjetas: [FlashCard]

    // @Published avisa a la vista cada vez que el valor cambia.
    // `private(set)` significa: cualquiera puede LEER el valor,
    // pero solo este ViewModel puede MODIFICARLO.

    // Posición de la tarjeta actual dentro del arreglo (empieza en 0).
    @Published private(set) var indiceActual = 0

    // `false` = se ve la pregunta, `true` = se ve la respuesta.
    @Published private(set) var mostrandoRespuesta = false

    // Inicializador: recibe las tarjetas desde afuera y las guarda.
    init(tarjetas: [FlashCard]) {
        self.tarjetas = tarjetas
    }

    // Propiedad calculada: no guarda un valor, lo calcula cada vez que se pide.
    // Devuelve la tarjeta actual, o `nil` (nada) si no hay tarjetas.
    // El signo `?` en `FlashCard?` indica que puede ser `nil` (un "opcional").
    var tarjetaActual: FlashCard? {
        // `guard` revisa una condición; si NO se cumple, sale de inmediato.
        // Aquí verificamos que el índice exista en el arreglo para evitar
        // un error al acceder a una posición inválida.
        guard tarjetas.indices.contains(indiceActual) else {
            return nil
        }

        return tarjetas[indiceActual]
    }

    // Voltea la tarjeta: si mostraba la pregunta, muestra la respuesta y viceversa.
    func voltear() {
        // Si no hay tarjeta, no hacemos nada.
        guard tarjetaActual != nil else { return }

        // `toggle()` cambia un Bool a su valor contrario (true ↔ false).
        mostrandoRespuesta.toggle()
    }

    // Avanza a la siguiente tarjeta.
    func siguiente() {
        // Si el arreglo está vacío, no hacemos nada.
        guard !tarjetas.isEmpty else { return }

        // El operador `%` (módulo) devuelve el residuo de una división.
        // Así, al llegar a la última tarjeta, el índice regresa a 0
        // y empezamos de nuevo. Ejemplo con 3 tarjetas: 0 → 1 → 2 → 0 → ...
        indiceActual = (indiceActual + 1) % tarjetas.count

        // Cada tarjeta nueva empieza mostrando la pregunta.
        mostrandoRespuesta = false
    }
}
