import SwiftUI

struct LightView: View {
    var light: BaseLight
    @State private var isToggleOn: Bool = false;
    
    var topBodyColor = Color(#colorLiteral(red: 1, green: 0.585469064, blue: 0.007283347876, alpha: 1))
    var bottomBodyColor = Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
    var disabledBodyColor = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
    var disabledBottomBodyColor = Color(#colorLiteral(red: 0.1296457852, green: 0.13403971, blue: 0.1354363952, alpha: 1))
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "gamecontroller")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .background(isToggleOn ? topBodyColor : disabledBodyColor)
                .clipShape(Circle())
                .padding(.top, 10)
            
            Text(light.name).bold().font(.system(size: 13))
                .padding(.bottom,10)
            
            
            Toggle(isOn: $isToggleOn) {}
                .toggleStyle(SwitchToggleStyle(tint: .gray))
                .labelsHidden()
                .background(
                    VStack {
                        RoundedRectangle(cornerRadius: 0)
                            .fill(isToggleOn ? bottomBodyColor : disabledBottomBodyColor)
                            .frame(width: 110, height: 55)
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 0,
                                    bottomLeadingRadius: 20,
                                    bottomTrailingRadius: 20,
                                    topTrailingRadius: 0
                                )
                            )
                    }
                    
                )
            
            
        }
        .frame(width: 110, height: 180)
        .background(isToggleOn ? topBodyColor : disabledBodyColor)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .gray, radius: 2, x: 0, y: 2)
        
        
        
        
    }
    
    
}


struct LightView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        LightView(light: BaseLight.sampleData[0])
        
    }
}
