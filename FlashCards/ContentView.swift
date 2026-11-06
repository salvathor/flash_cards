// Importamos SwiftUI, el framework de Apple para construir interfaces de usuario
// de forma declarativa (describimos "qué" queremos ver, no "cómo" dibujarlo).
import SwiftUI

// Una vista en SwiftUI es una estructura (struct) que cumple con el protocolo `View`.
// `ContentView` es la vista principal que muestra varios controles de ejemplo.
struct ContentView: View {

    // MARK: - PROPIEDADES DE ESTADO
    // `@State` indica que esta variable es un "estado" de la vista.
    // Cuando su valor cambia, SwiftUI vuelve a dibujar la vista automáticamente.
    // Usamos `private` porque solo esta vista debe modificar estos valores.

    // Guarda el texto que el usuario escribe en el TextField.
    @State private var texto: String = ""
    // Guarda si el Toggle (interruptor) está encendido (true) o apagado (false).
    @State private var stateToggle = false
    // Guarda el tamaño de fuente que controla el Slider.
    // `CGFloat` es un tipo numérico decimal usado para medidas en pantalla.
    @State private var fontSize: CGFloat = 20.00

    // MARK: - BODY
    // `body` es la propiedad obligatoria de toda vista.
    // Aquí describimos todo lo que se va a mostrar en pantalla.
    // `some View` significa "algún tipo de vista" (SwiftUI deduce el tipo exacto).
    var body: some View {

        // MARK: - VERTICAL STACK
        // `VStack` acomoda sus elementos uno debajo de otro (en vertical).
        VStack{
            // MARK: - BOTON SIMPLE
            // El primer parámetro es el texto del botón y el bloque entre llaves { }
            // es la acción que se ejecuta cuando el usuario lo toca.
            Button("Boton simple") {
                // `print` muestra un mensaje en la consola de Xcode (útil para depurar).
                print("Boton simple")
            }
            // MARK: - BOTON CON MODIFICADORES
            // Esta forma de Button separa la acción (`action`) de la apariencia (`label`),
            // lo que nos permite personalizar cómo se ve el botón.
            Button(action:{
                print("Boton con modificadores")
            }){
                // Los "modificadores" son funciones que se encadenan con un punto (.)
                // y cambian la apariencia o el comportamiento de una vista.
                // El orden importa: cada modificador se aplica sobre el resultado anterior.
                Text("Boton Modificado")
                    .font(.largeTitle)          // Tamaño de letra grande
                    .foregroundColor(.white)    // Color del texto
                    .padding()                  // Espacio interno alrededor del texto
                    .background(Color.green)    // Color de fondo (incluye el padding)
                    .cornerRadius(20)           // Redondea las esquinas
            }
            // `frame` define el tamaño del área que ocupa la vista.
            .frame(width: 220)

            // MARK: - IMAGEN CON ZSTACK
            // `ZStack` encima las vistas una sobre otra (en profundidad).
            // La primera vista queda al fondo y la última queda al frente.
            ZStack {
                // Un color también es una vista; aquí funciona como fondo azul.
                Color.blue
                    .frame(width: 250, height: 250)
                    .ignoresSafeArea(edges: .all)
                    // Un radio de la mitad del ancho (125 de 250) lo convierte en círculo.
                    .cornerRadius(125)
                // Muestra la imagen llamada "tux" guardada en Assets.xcassets.
                Image("tux")
                    // `resizable` permite que la imagen cambie de tamaño;
                    // sin él, `frame` no podría escalar la imagen.
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(100)
            }
            .frame(width: 220)

            // MARK: - TEXTFIELD
            // Campo para que el usuario escriba texto.
            // El primer parámetro es el texto de ayuda (placeholder).
            // `$texto` es un "binding": una conexión de doble vía con la variable `texto`.
            // Lo que el usuario escribe se guarda en `texto`, y si `texto` cambia,
            // el campo se actualiza.
            TextField("Ingresa un texto", text:$texto)
                .textFieldStyle(.roundedBorder) // Estilo con borde redondeado
                .padding()
                .frame(width: 220)

            // MARK: - TOGGLE
            // Un VStack dentro de otro VStack: podemos anidar contenedores
            // para agrupar elementos relacionados.
            VStack{
                // `Toggle` es un interruptor de encendido/apagado.
                // `$stateToggle` conecta el interruptor con la variable de estado.
                Toggle(isOn: $stateToggle){
                    Text("Activado/Desactivado")
                }.padding()
                // `\( ... )` inserta un valor dentro de un texto (interpolación).
                // `condición ? valorSiVerdadero : valorSiFalso` es el operador ternario.
                Text("El estado es: \(stateToggle ? "Activado" : "Desactivado")")
                    .padding()
            }
            .frame(width: 220)

            // MARK: - DIVIDER
            // Dibuja una línea delgada para separar visualmente secciones.
            Divider()

            // MARK: - SLIDER
            // `Slider` es una barra deslizante para elegir un número.
            // `in: 10...50` define el rango (mínimo 10, máximo 50)
            // y `step: 1` hace que avance de 1 en 1.
            // El valor elegido se guarda en `fontSize` gracias al binding `$fontSize`.
            Slider(value: $fontSize, in: 10...50, step: 1)
                .padding()
                .frame(width: 220)
        }

    }
}

// MARK: - PREVIEW
// `#Preview` permite ver la vista en el lienzo (Canvas) de Xcode
// sin necesidad de ejecutar la app en el simulador.
#Preview {
    ContentView()
}
