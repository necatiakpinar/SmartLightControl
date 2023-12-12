import SwiftUI

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    
    private let appearanceRows = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    private let lightRows = [GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Section(header:Text("Appearances"))
            {
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: appearanceRows, spacing: 0) {
                            ForEach(room.appearances) { appearance in
                                AppearanceView(appearance: appearance)
                                    .padding()
                                    .frame(maxWidth: geometry.size.width / 3.3)
                                
                            }
                        }
                    }
                    .frame(height: 300)
                    .background(Color(UIColor.systemGroupedBackground))
                }
                
            }
            
            Section(header:Text("Lights"))
            {
                GeometryReader { geometry in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: lightRows, spacing: 0) {
                            ForEach(room.lights) { light in
                                LightView(light: light)
                                    .padding()
                                    .frame(maxWidth: geometry.size.width / 3.3)
                            }
                        }
                    }
                    .frame(height: 200)
                    .background(Color(UIColor.systemGroupedBackground))
                }
                
            }
        
            
        }
        .background(Color(UIColor.systemGroupedBackground))
        
        
    }
}
struct RoomDetailView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        RoomDetailView(room: .constant(BaseRoom.sampleData[0]))
    }
}
