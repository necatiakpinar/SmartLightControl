import SwiftUI

struct RoomCardView:  View {
    @Binding var room: BaseRoom
    @State private var isToggleOn: Bool = false
    @State private var sliderValue: Double = 50
    
    var body: some View {
        
        VStack {
            HStack() {
                Image(systemName: "gamecontroller")
                VStack(alignment: .leading) {
                    Text("\(room.name)").bold()
                    Text("All lights are disabled.").font(.caption2)
                    
                }
                Toggle(isOn: $isToggleOn){}
                    .toggleStyle(SwitchToggleStyle(tint: .gray))
                
            }
            Slider(value: $sliderValue, in: 0...100)
                .accentColor(.white)
                .onAppear {
                    let progressCircleConfig = UIImage.SymbolConfiguration(scale: .small)
                    UISlider.appearance()
                        .setThumbImage(UIImage(systemName: "circle.fill",
                                               withConfiguration: progressCircleConfig), for: .normal)
                }
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .background(.purple)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
        
    }
    
    
}

struct RoomCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        RoomCardView(room:.constant(BaseRoom.sampleData[0]))
    }
}


