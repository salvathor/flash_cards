//
//  FlashCardViewModel.swift
//  FlashCards
//
//  Created by Salvador Lopez on 05/11/26.
//

// Foundation: biblioteca básica de Apple (textos, fechas, UUID, etc.).
import Foundation

// Combine aporta ObservableObject y @Published para comunicar cambios de estado.
// FlashCardsView observa este objeto mediante @StateObject; las publicaciones
// permiten que SwiftUI actualice la interfaz con la tarjeta y el lado seleccionados.
import Combine`, Swift no reconocería `ObservableObject` ni `@Published`.
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
// La clase mantiene una identidad compartida durante la vida del estado de la vista.
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
    // Devuelve la tarjeta actual, o `nil` si el índice no pertenece al arreglo.
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

    // Avanza de forma circular: después de la última tarjeta vuelve a la primera.
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

    // Retrocede de forma circular: desde la primera tarjeta pasa a la última.
    func anterior() {
        // Si el arreglo está vacío, no hacemos nada.
        guard !tarjetas.isEmpty else { return }

        // Sumamos `tarjetas.count` antes del módulo para no obtener un
        // número negativo. Así, desde la primera tarjeta (0) saltamos
        // a la última. Ejemplo con 3 tarjetas: 0 → 2 → 1 → 0 → ...
        indiceActual = (indiceActual - 1 + tarjetas.count) % tarjetas.count

        // Cada tarjeta empieza mostrando la pregunta.
        mostrandoRespuesta = false
    }
}
