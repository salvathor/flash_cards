//
//  FlashCard.swift
//  FlashCards
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
// Permite distinguir tarjetas por identidad si se usan en listas o ForEach.
struct FlashCard: Identifiable {

    // Identidad generada al crear la tarjeta; se conserva al copiar este valor.
    // No se persiste entre ejecuciones de la app.
    let id = UUID()

    // Texto que se muestra al frente de la tarjeta.
    let pregunta: String

    // Texto que se muestra al voltear la tarjeta.
    let respuesta: String

    // Al no declarar un inicializador propio, Swift genera uno para estas propiedades:
    // FlashCard(pregunta: "...", respuesta: "...")
}
