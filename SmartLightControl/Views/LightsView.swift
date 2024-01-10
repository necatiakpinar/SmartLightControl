import SwiftUI

struct LightsView: View {
    @Binding var room: BaseRoom
    private let lightRows = [GridItem(.flexible(), spacing: 0)]
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false)
        {
            LazyHGrid(rows: lightRows, spacing: 10, content: {
                ForEach(room.lights) { light in
                    LightView(light: light)
                    
                }
            })
        }
        
    }
    
}

#Preview {
    LightsView(room: .constant(BaseRoom.sampleData[0]))
}
