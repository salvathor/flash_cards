//
//  FlashCardData.swift
//  FlashCards
//
//  Created by Salvador Lopez on 11/11/26.
//
// Catálogo de preguntas y respuestas utilizado por la pantalla de estudio.
// El enum sin casos agrupa los datos sin necesitar instancias.
enum FlashCardData {
    // Colección compartida que se inicializa en el primer acceso.
    // Para agregar una tarjeta, añade un FlashCard(pregunta:respuesta:) al arreglo.
    static let tarjetas: [FlashCard] = [
        
        FlashCard(pregunta: "Swift es un lenguaje de programación de tipo seguro que fue desarrollado por Apple para reemplazar Objective-C en el desarrollo de aplicaciones iOS", respuesta: "VERDADERO"),
        FlashCard(pregunta: "¿Para qué sirve @State en SwiftUI?", respuesta: "Para guardar estado local en una vista."),
        FlashCard(pregunta: "¿Qué es un ViewModel?", respuesta: "Un objeto que administra datos y lógica para una vista."),
        FlashCard(pregunta: "¿Qué es SwiftUI?", respuesta: "Un framework declarativo para crear interfaces gáficas."),
        FlashCard(pregunta: "En una aplicación iOS que consume mucha memoria durante la carga de imágenes de alta resolución, ¿cuál es la técnica más efectiva para optimizar la reactividad de la interfaz de usuario sin bloquear el hilo principal?", respuesta: "Descargar y procesar imágenes en segundo plano usando Grand Central Dispatch"),
        FlashCard(pregunta: "El Main Thread en iOS es responsable de procesar todas las actualizaciones de la interfaz de usuario, por lo que cualquier operación de larga duración debe ejecutarse en ese hilo para garantizar que la aplicación sea reactiva.", respuesta: "La afirmación es falsa. Aunque el Main Thread es responsable de actualizar la interfaz de usuario, las operaciones de larga duración NUNCA deben ejecutarse en ese hilo porque bloquearían la interfaz y la aplicación se volvería no reactiva."),
        FlashCard(pregunta: "En Swift, ¿cuál es la principal diferencia entre una estructura (struct) y una clase (class) en términos de inicialización?", respuesta: "Las estructuras generan automáticamente un inicializador por defecto, mientras que las clases no lo hacen."),
        FlashCard(pregunta: "Según el contenido del curso, ¿cuál es la herramienta de Xcode que se utiliza para realizar debugging básico de una aplicación iOS durante su desarrollo?", respuesta: "Simuladores y debugging básico"),
        FlashCard(pregunta: "¿Cuál es el propósito principal del ciclo de vida de una aplicación iOS?", respuesta: "Definir los estados por los que pasa una app desde su lanzamiento hasta su terminación, permitiendo ejecutar código en momentos específicos."),
        FlashCard(pregunta: "¿Cuál es la principal ventaja de usar Core Data en lugar de UserDefaults para almacenar datos en una aplicación iOS?", respuesta: "Core Data permite guardar objetos complejos con relaciones entre entidades."),
        FlashCard(pregunta: " En iOS, URLSession permite realizar solicitudes HTTP de forma síncrona y asíncrona para comunicarse con servidores remotos.", respuesta: "Verdadero. URLSession es la clase fundamental en iOS para realizar solicitudes de red, y proporciona tanto métodos síncronos como asincronos para comunicarse con servidores remotos."),
        FlashCard(pregunta: "En una aplicación iOS, ¿cómo influye el manejo adecuado de concurrencia en el rendimiento de una solicitud de red?", respuesta: "Permite que la interfaz de usuario permanezca responsiva mientras ocurren descargas."),
        FlashCard(pregunta: "El protocolo Codable en Swift solo permite la decodificación de datos JSON, no la codificación.", respuesta: "Falso. El protocolo Codable en Swift es en realidad un alias que combina tanto Decodable como Encodable."),
        FlashCard(pregunta: "¿Cuál es el propósito principal de realizar pruebas unitarias en el desarrollo de aplicaciones iOS?", respuesta: "Verificar que componentes individuales del código funcionen correctamente de forma aislada."),
        FlashCard(pregunta: "Herramienta de análisis de rendimiento y diagnóstico de memoria, CPU y energía.", respuesta: "Instruments"),
        FlashCard(pregunta: "Framework de persistencia local que permite almacenar datos estructurados en el dispositivo.", respuesta: "Swift Data Framework."),
        FlashCard(pregunta: "Herramienta para realizar solicitudes HTTP y gestionar tareas de red de forma asincrónica.", respuesta: "URLSession."),
        FlashCard(pregunta: "Suite de pruebas unitarias para validar la lógica y comportamiento del código.", respuesta: "XCTest."),
        FlashCard(pregunta: "Framework reactivo que gestiona flujos de datos y eventos a lo largo del tiempo.", respuesta: "Combine."),
        FlashCard(pregunta: "¿Cuál es la función principal de Kotlin Multiplataforma (KMP) en el contexto del desarrollo de aplicaciones?", respuesta: "Compartir la lógica de negocio entre las apps de iOS y Android"),
        FlashCard(pregunta: "Swift es un lenguaje de programación de tipo seguro que fue desarrollado por Apple para reemplazar Objective-C en el desarrollo de aplicaciones iOS", respuesta: "Swift es efectivamente un lenguaje de programación de tipo seguro creado por Apple en 2014 como sucesor de Objective-C."),
        FlashCard(pregunta: "Kotlin Multiplataforma permite desarrollar aplicaciones iOS nativas utilizando únicamente el lenguaje Kotlin sin necesidad de escribir código en Swift o Objective-C.", respuesta: "Aunque Kotlin Multiplataforma permite compartir lógica de negocio entre plataformas, el desarrollo de interfaces de usuario nativas para iOS aún requiere Swift u Objective-C."),
        FlashCard(pregunta: "Al diseñar una interfaz en iOS, necesitas mostrar múltiples vistas en una disposición vertical donde cada elemento ocupa el ancho completo de la pantalla. ¿Cuál es la estructura jerárquica más apropiada para este caso?", respuesta: "Una vista contenedora con orientación vertical que agrupa las subvistas."),
        FlashCard(pregunta: "En iOS, la jerarquía de vistas permite organizar componentes de interfaz de usuario de manera anidada, donde una vista contenedora puede alojar múltiples subvistas que heredan propiedades de posicionamiento y transformación de su vista padre.", respuesta: "La afirmación es verdadera. La jerarquía de vistas en iOS es un concepto central en la construcción de interfaces; las vistas se organizan en una estructura de árbol donde las vistas padres contienen subvistas, y estas heredan propiedades como transformaciones y algunos atributos de posicionamiento de sus contenedores. "),
        FlashCard(pregunta: "¿Cuál es el propósito principal de utilizar Core Data en el desarrollo de aplicaciones iOS?", respuesta: "Realizar el modelado y la persistencia de datos en la aplicación"),
        FlashCard(pregunta: "Core Data es el único método disponible en iOS para almacenar datos de forma persistente en el dispositivo.", respuesta: "La afirmación es falsa. iOS ofrece múltiples opciones para persistencia local, incluyendo UserDefaults para preferencias simples, Core Data para modelos de datos complejos, archivos en el sistema de archivos del dispositivo, y SQLite para bases de datos relacionales.")
        
    ]
}
