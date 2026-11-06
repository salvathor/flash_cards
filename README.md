# FlashCards

App de tarjetas de estudio (flash cards) para iOS, construida con **SwiftUI** y el patrón **MVVM**. Cada tarjeta muestra una pregunta; al tocarla se voltea para ver la respuesta, y el botón **Siguiente** avanza a la próxima tarjeta (al llegar al final vuelve a empezar).

El código está comentado en español con fines didácticos, explicando cada concepto de Swift y SwiftUI que se usa.

## Características

- Tarjetas con pregunta y respuesta sobre desarrollo iOS (Swift, SwiftUI, Core Data, URLSession, concurrencia, pruebas, etc.).
- Toque sobre la tarjeta para voltearla.
- Contador "Tarjeta X de N".
- Navegación circular entre tarjetas.
- Vista de ejemplo (`ContentView`) con controles básicos de SwiftUI: `Button`, `Image`, `ZStack`, `TextField`, `Toggle`, `Divider` y `Slider`.

## Arquitectura (MVVM)

```
FlashCards/
├── MyApp.swift                     # Punto de entrada (@main)
├── FlashCardContentView.swift      # Contenedor: define la lista de tarjetas
├── ContentView.swift               # Vista de ejemplo con controles de SwiftUI
├── Model/
│   └── FlashCard.swift             # Modelo: pregunta y respuesta (Identifiable)
├── VistaModelo/
│   └── FlashCardViewModel.swift    # ViewModel: índice actual, voltear, siguiente
├── Vista/
│   └── FlashCardView.swift         # Vista: muestra la tarjeta y los botones
└── Assets.xcassets                 # Recursos (imagen "tux", color de acento)
```

| Capa | Archivo | Responsabilidad |
| --- | --- | --- |
| Modelo | `FlashCard.swift` | Describe los datos de una tarjeta. |
| ViewModel | `FlashCardViewModel.swift` | Contiene la lógica y el estado (`ObservableObject` + `@Published`). |
| Vista | `FlashCardView.swift` | Dibuja la interfaz y reenvía las acciones del usuario al ViewModel (`@StateObject`). |

## Requisitos

- Xcode con soporte para SwiftUI
- iOS (simulador o dispositivo)

## Cómo ejecutarlo

1. Clona el repositorio:
   ```bash
   git clone https://github.com/salvathor/flash_cards.git
   ```
2. Abre `FlashCards.xcodeproj` en Xcode.
3. Elige un simulador y presiona **Run** (⌘R).

## Agregar tarjetas

Edita el arreglo `tarjetas` en `FlashCards/FlashCardContentView.swift`:

```swift
FlashCard(pregunta: "¿Qué es SwiftUI?", respuesta: "Un framework declarativo para crear interfaces gráficas.")
```

## Cambiar la vista inicial

En `MyApp.swift` puedes alternar entre la app de tarjetas y la vista de ejemplo de controles:

```swift
WindowGroup {
    //ContentView()
    FlashCardContentView()
}
```

## Autor

Salvador Lopez
