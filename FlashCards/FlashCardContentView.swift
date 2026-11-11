//
//  FlashCardContentView.swift
//  FlashCards
//
//  Created by Salvador Lopez on 05/11/26.
//

import SwiftUI

// VISTA CONTENEDORA
// Esta vista obtiene las tarjetas de `FlashCardData` y las entrega
// a `FlashCardsView`, que presenta la sesión de estudio.
// El catálogo queda separado de la interfaz para reutilizar la vista con otras tarjetas.
struct FlashCardContentView: View {

    // La lista se define en Model/FlashCardData.swift.
    
    var body: some View {
        // `tarjetas` es una propiedad estática: se consulta sin crear una instancia.
        FlashCardsView(tarjetas: FlashCardData.tarjetas)
    }
}

// PREVIEW: muestra esta vista en el Canvas de Xcode con todas las tarjetas.
#Preview {
    FlashCardContentView()
}


