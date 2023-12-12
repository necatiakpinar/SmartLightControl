import SwiftUI

struct LightView: View {
    var light: BaseLight
    @State private var isToggleOn: Bool = false;
    
    
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .background(.orange)
                .clipShape(Circle())
                .padding(.bottom, 10)
            
            Text(light.name).bold().font(.system(size: 13))
            
            Toggle(isOn: $isToggleOn) {}
                .toggleStyle(SwitchToggleStyle(tint: .gray))
                .labelsHidden()

        }
        .frame(width: 110, height: 180)
        .background(.orange)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray,lineWidth: 1)
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
        )
        
        
    }
    
    
}


struct LightView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        LightView(light: BaseLight.sampleData[0])
        
    }
}
