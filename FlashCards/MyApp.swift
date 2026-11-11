import SwiftUI

// PUNTO DE ENTRADA DE LA APP
// `@main` le indica a Swift que la app empieza aquí.
// `App` es el protocolo que describe una aplicación en SwiftUI.
@main struct MyApp: App {

    // `body` define las "escenas" (ventanas) de la app.
    var body: some Scene {
        // WindowGroup define la escena que presenta la pantalla de estudio.
        WindowGroup {
            // Vista inicial: conecta el catálogo de tarjetas con la interfaz de estudio.
            FlashCardContentView()
        }
    }
}
