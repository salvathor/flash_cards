import SwiftUI
import Playgrounds

struct ContentView: View {
    
    @State private var texto: String = ""
    @State private var stateToggle = false
    @State private var fontSize: CGFloat = 20.00
    
    var body: some View {
        
        ScrollView(.horizontal){
            //HStack(alignment: .center, spacing: 24){
                
            //}
            
            // VERTICAL STACK
            VStack{
                //BOTON SIMPLE
                Button("Boton simple") {
                    print("Boton simple")
                }
                //BOTON CON MODIFICADORES
                Button(action:{
                    print("Boton con modificadores")
                }){
                    Text("Boton Modificado")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(20)
                }
                .frame(width: 220)
                
                //IMAGEN CON ZSTACK
                ZStack {
                    Color.blue
                        .frame(width: 250, height: 250)
                        .ignoresSafeArea(edges: .all)
                        .cornerRadius(125)
                    Image("tux")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(100)
                }
                .frame(width: 220)
                
                //TEXTFIELD
                TextField("Ingresa un texto", text:$texto)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 220)
                
                //TOGGLE
                VStack{
                    Toggle(isOn: $stateToggle){
                        Text("Activado/Desactivado")
                    }.padding()
                    Text("El estado es: \(stateToggle ? "Activado" : "Desactivado")")
                        .padding()
                }
                .frame(width: 220)
                
                //DIVIDER
                Divider()
                
                //SLIDER
                Slider(value: $fontSize, in: 10...50, step: 1)
                    .padding()
                    .frame(width: 220)
            }
            
        }
        
        
        
        
    }
}

#Preview {
    ContentView()
}

//#Playground {
//    _ = 1 + 2
//}
