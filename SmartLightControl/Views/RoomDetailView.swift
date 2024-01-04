import SwiftUI

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    
    private let appearanceRows = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    private let lightRows = [GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: appearanceRows, spacing: 10) {
                    ForEach(room.appearances) { appearance in
                        AppearanceView(appearance: appearance)
                        
                    }
                }
            }
            .frame(height: 260)
            .background(Color(UIColor.systemGroupedBackground))
            .padding(.leading, 10)
            
            
            ScrollView(.horizontal, showsIndicators: false)
            {
                LazyHGrid(rows: lightRows, spacing: 10, content: {
                    ForEach(room.lights) { light in
                        LightView(light: light)
                            
                    }
                })
            }
            .frame(height: 260)
            .background(Color(UIColor.systemGroupedBackground))
            .padding(.leading, 10)
    
            
            Spacer()
            
        }
        .background(Color(UIColor.systemGroupedBackground))
        //.frame(width: .infinity, height: .infinity, alignment: .top)
        
        
    }
}
struct RoomDetailView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        RoomDetailView(room: .constant(BaseRoom.sampleData[0]))
    }
}
