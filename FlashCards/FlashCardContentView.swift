//
//  SwiftUIView.swift
//  FlashCards
//
//  Created by Salvador Lopez on 05/11/26.
//

import SwiftUI

// VISTA CONTENEDORA
// Esta vista prepara los datos (la lista de tarjetas) y se los entrega
// a `FlashCardsView`, que es la que realmente los muestra.
// Separar "quién tiene los datos" de "quién los dibuja" hace que
// `FlashCardsView` se pueda reutilizar con cualquier lista de tarjetas.
struct FlashCardContentView: View {

    // Arreglo con todas las tarjetas de estudio.
    // `private` = solo esta vista puede usarlo.
    // `let` = es una constante, no cambia mientras la app corre.
    // `[FlashCard]` = "un arreglo de elementos de tipo FlashCard".
    // Cada elemento se crea con FlashCard(pregunta:respuesta:) y se separa con coma.
    
    var body: some View {
        // Mostramos la vista de tarjetas y le pasamos nuestro arreglo.
        FlashCardsView(tarjetas: FlashCardData.tarjetas)
    }
}

// PREVIEW: muestra esta vista en el Canvas de Xcode con todas las tarjetas.
#Preview {
    FlashCardContentView()
}


