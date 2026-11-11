// Importamos SwiftUI, el framework de Apple para construir interfaces de usuario
// de forma declarativa (describimos "qué" queremos ver, no "cómo" dibujarlo).
import SwiftUI

// Una vista en SwiftUI es una estructura (struct) que cumple con el protocolo `View`.
// `ContentView` es una vista de práctica con controles de ejemplo.
// La app inicia en `FlashCardContentView`; esta vista se puede explorar en el Canvas.
struct ContentView: View {

    // MARK: - PROPIEDADES DE ESTADO
    // `@State` indica que esta variable es un "estado" de la vista.
    // Cuando su valor cambia, SwiftUI vuelve a dibujar la vista automáticamente.
    // Usamos `private` porque solo esta vista debe modificar estos valores.

    // Guarda el texto que el usuario escribe en el TextField.
    @State private var texto: String = ""
    // Guarda si el Toggle (interruptor) está encendido (true) o apagado (false).
    @State private var stateToggle = false
    // Guarda el valor del Slider; actualmente no se aplica a ningún texto.
    // `CGFloat` es un tipo numérico decimal usado para medidas en pantalla.
    @State private var fontSize: CGFloat = 20.00

    // MARK: - BODY
    // `body` es la propiedad obligatoria de toda vista.
    // Aquí describimos todo lo que se va a mostrar en pantalla.
    // `some View` significa "algún tipo de vista" (SwiftUI deduce el tipo exacto).
    var body: some View {

        // MARK: - SCROLL VIEW
        // `ScrollView` es un contenedor que permite desplazar su contenido
        // cuando este es más grande que el espacio disponible en pantalla.
        //
        // ¿Cómo funciona?
        // - Por defecto el desplazamiento es VERTICAL (`.vertical`), es decir,
        //   el usuario arrastra el dedo hacia arriba o hacia abajo.
        //   Escribir `ScrollView { }` equivale a `ScrollView(.vertical) { }`.
        //   Si quisiéramos desplazar hacia los lados usaríamos `ScrollView(.horizontal)`.
        // - El ScrollView le ofrece a su contenido una altura "ilimitada", así que
        //   el VStack puede medir lo que necesite; si mide más que la pantalla,
        //   el excedente se alcanza deslizando.
        // - Si el contenido SÍ cabe en pantalla, no hay nada que desplazar y la
        //   vista se comporta casi igual que sin ScrollView (solo rebota al arrastrar).
        // - Muestra automáticamente un indicador (barra delgada) mientras se desliza.
        //
        // ¿Por qué lo necesitamos aquí?
        // Al girar el teléfono o el simulador a horizontal (izquierda o derecha),
        // la altura disponible se reduce mucho y los controles de abajo
        // (TextField, Toggle, Slider) quedarían fuera de la pantalla sin poder tocarlos.
        // Con el ScrollView el usuario puede deslizar para llegar a ellos.
        ScrollView {

        // MARK: - VERTICAL STACK
        // `VStack` acomoda sus elementos uno debajo de otro (en vertical).
        // `spacing: 16` separa los elementos para que sea más fácil tocarlos.
        VStack(spacing: 16){
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
            // `maxWidth` deja que se adapte al ancho disponible sin pasar de 400,
            // así se ve bien tanto en vertical como en horizontal.
            .frame(maxWidth: 400)

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
            // Ocupa todo el ancho disponible para que el círculo quede centrado.
            .frame(maxWidth: .infinity)

            // MARK: - TEXTFIELD
            // Campo para que el usuario escriba texto.
            // El primer parámetro es el texto de ayuda (placeholder).
            // `$texto` es un "binding": una conexión de doble vía con la variable `texto`.
            // Lo que el usuario escribe se guarda en `texto`, y si `texto` cambia,
            // el campo se actualiza.
            TextField("Ingresa un texto", text:$texto)
                .textFieldStyle(.roundedBorder) // Estilo con borde redondeado
                .padding()
                .frame(maxWidth: 400)

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
            .frame(maxWidth: 400)

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
                .frame(maxWidth: 400)
        }
        // El VStack ocupa todo el ancho de la pantalla y deja un margen alrededor.
        .frame(maxWidth: .infinity)
        .padding()

        // MARK: - FIN DEL SCROLL VIEW
        // Esta llave cierra el ScrollView: todo lo que está entre `ScrollView {`
        // y esta llave es el contenido que se puede desplazar.
        }

    }
}

// MARK: - PREVIEW
// `#Preview` permite ver la vista en el lienzo (Canvas) de Xcode
// sin necesidad de ejecutar la app en el simulador.
#Preview {
    ContentView()
}
