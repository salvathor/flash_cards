//
//  FlashCardView.swift
//  FlashCards
//
//  Created by Salvador Lopez on 05/11/26.
//

import SwiftUI

// VISTA
// La vista se encarga solo de lo VISUAL: muestra los datos del ViewModel
// y le avisa cuando el usuario toca algo. No contiene lógica propia.
struct FlashCardsView: View {

    // @StateObject conserva el ViewModel mientras se mantenga la identidad de la vista.
    // Así se conserva la tarjeta seleccionada cuando SwiftUI actualiza la interfaz.
    @StateObject private var viewModel: FlashCardsViewModel

    // Inicializador personalizado: recibimos las tarjetas y con ellas
    // creamos el ViewModel.
    // El guion bajo en `_viewModel` accede al "contenedor" de @StateObject;
    // es la forma de darle un valor inicial desde un `init`.
    init(tarjetas: [FlashCard]) {
        _viewModel = StateObject(
            wrappedValue: FlashCardsViewModel(tarjetas: tarjetas)
        )
    }

    // `body` describe la interfaz a partir del estado observable del ViewModel.
    var body: some View {
        // VStack acomoda los elementos uno debajo de otro.
        // `spacing: 24` es la separación entre cada elemento.
        VStack(spacing: 24) {

            // `if let` intenta "desempaquetar" el opcional:
            // si hay una tarjeta, la guarda en `tarjeta` y entra al bloque;
            // si es `nil`, se va al `else`.
            if let tarjeta = viewModel.tarjetaActual {

                // Contador. Sumamos 1 porque el índice empieza en 0,
                // pero para el usuario la primera tarjeta es la "1".
                // `\( )` inserta el valor de una variable dentro del texto.
                Text(
                    "Tarjeta \(viewModel.indiceActual + 1) de \(viewModel.tarjetas.count)"
                )
                .font(.subheadline)
                .foregroundStyle(.secondary)  // Estilo secundario adaptado al entorno.

                // La tarjeta completa es un botón: al tocarla se voltea.
                Button {
                    // Acción: lo que pasa al tocar el botón.
                    viewModel.voltear()
                } label: {
                    // Label: lo que se ve dentro del botón.
                    VStack(spacing: 16) {

                        // Operador ternario:  condición ? siVerdadero : siFalso
                        // Muestra la etiqueta según el lado de la tarjeta.
                        Text(
                            viewModel.mostrandoRespuesta
                                ? "Respuesta"
                                : "Pregunta"
                        )
                        .font(.caption)
                        .foregroundStyle(.secondary)

                        // Texto principal: la pregunta o la respuesta.
                        Text(
                            viewModel.mostrandoRespuesta
                                ? tarjeta.respuesta
                                : tarjeta.pregunta
                        )
                        .font(.title2)
                        .foregroundStyle(.primary)
                        .multilineTextAlignment(.center)  // Centra textos largos.
                    }
                    // Los modificadores se aplican en orden, de arriba hacia abajo.
                    .padding()                         // Espacio interno.
                    .frame(maxWidth: .infinity)        // Ocupa todo el ancho.
                    .frame(minHeight: 240)             // Altura mínima de la tarjeta.
                    .background(
                        // Color según el lado: verde para la respuesta,
                        // azul para la pregunta (ambos muy transparentes).
                        (viewModel.mostrandoRespuesta ? Color.green : Color.blue)
                            .opacity(0.12),
                        in: RoundedRectangle(cornerRadius: 24)  // Esquinas redondeadas.
                    )
                    // Anima el cambio de color al voltear la tarjeta.
                    .animation(.easeInOut, value: viewModel.mostrandoRespuesta)
                }
                // `.plain` conserva la apariencia personalizada de la tarjeta.
                .buttonStyle(.plain)

                // Instrucción para el usuario.
                Text("Toca la tarjeta para voltearla")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                // HStack acomoda los botones uno al lado del otro.
                HStack(spacing: 16) {
                    // Botón para regresar a la tarjeta anterior.
                    Button("Anterior") {
                        viewModel.anterior()
                    }
                    .buttonStyle(.bordered)  // Botón con borde, menos destacado.

                    // Botón para pasar a la siguiente tarjeta.
                    Button("Siguiente") {
                        viewModel.siguiente()
                    }
                    .buttonStyle(.borderedProminent)  // Botón relleno y destacado.
                }

            } else {
                // Se muestra cuando el ViewModel no devuelve una tarjeta válida.
                Text("No hay tarjetas disponibles")
                    .foregroundStyle(.secondary)
            }
        }
        .padding()  // Margen alrededor de todo el contenido.
    }
}

// PREVIEW
// Permite ver la vista en el Canvas de Xcode sin correr la app.
// Le pasamos unas tarjetas de ejemplo porque la vista las necesita.
#Preview {
    FlashCardsView(tarjetas: [
        FlashCard(pregunta: "¿Qué es SwiftUI?", respuesta: "Un framework declarativo para crear interfaces gráficas."),
        FlashCard(pregunta: "¿Para qué sirve @State?", respuesta: "Para guardar estado local en una vista.")
    ])
}
