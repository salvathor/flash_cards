import SwiftUI

// PUNTO DE ENTRADA DE LA APP
// `@main` le indica a Swift que la app empieza aquí.
// `App` es el protocolo que describe una aplicación en SwiftUI.
@main struct MyApp: App {

    // `body` define las "escenas" (ventanas) de la app.
    var body: some Scene {
        // WindowGroup crea la ventana principal.
        WindowGroup {
            // Primera vista que se muestra al abrir la app.
            //ContentView()
            FlashCardContentView()
        }
    }
}
