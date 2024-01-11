import SwiftUI

struct AppearanceView: View {
    var appearance: BaseAppearance
    
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .background(.orange)
                .clipShape(Circle())
                .padding(.bottom, 10)
            
            Text(appearance.name).bold().font(.system(size: 13))
            
        }
        .frame(width: 90, height: 100)
        .background(Theme.ColorScheme.primary.color)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray,lineWidth: 1)
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
            )
        .shadow(color: .gray, radius: 2, x: 0, y: 1)
        
        
    }
}

struct AppearanceView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        AppearanceView(appearance: BaseAppearance.sampleData[0])
    }
}
