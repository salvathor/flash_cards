//
//  Flashcard.swift
//  MyApp
//
//  Created by Salvador Lopez on 05/11/26.
//

import Foundation

// MODELO
// El modelo representa los DATOS de la app. No sabe nada de cómo se ven
// en pantalla; solo describe qué información tiene una tarjeta.
//
// Usamos un `struct` porque una tarjeta es un valor simple: cuando se copia,
// cada copia es independiente.
//
// `Identifiable` es un protocolo que obliga a tener una propiedad `id`.
// SwiftUI lo usa para distinguir una tarjeta de otra (por ejemplo, en listas).
struct FlashCard: Identifiable {

    // Identificador único. `UUID()` genera un valor aleatorio distinto
    // cada vez que se crea una tarjeta.
    let id = UUID()

    // Texto que se muestra al frente de la tarjeta.
    let pregunta: String

    // Texto que se muestra al voltear la tarjeta.
    let respuesta: String

    // Nota: no escribimos un `init`. Los structs generan uno automáticamente:
    // FlashCard(pregunta: "...", respuesta: "...")
}
