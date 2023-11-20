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
            
            Text(appearance.name).bold()
            
        }
        .frame(width: 100, height: 100)
        .background(Theme.ColorScheme.primary.color)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray,lineWidth: 1)
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
            )
        
    }
}

struct AppearanceView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        AppearanceView(appearance: BaseAppearance.sampleData[0])
    }
}
