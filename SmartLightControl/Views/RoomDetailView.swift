import SwiftUI

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    
    private let appearanceRows = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    private let lightRows = [GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        VStack {
            
            NavigationView(content: {
                List {
                    Section(header: Text("Appearances"))
                    {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: appearanceRows, spacing: 10) {
                                ForEach(room.appearances) { appearance in
                                    AppearanceView(appearance: appearance)
                                    
                                }
                            }
                        }
                        .listRowBackground(Color(UIColor.systemGroupedBackground))
                        
                    }
                    .listRowSeparator(.hidden)
                    
                    
                    Section(header: Text("Lights"))
                    {
                        ScrollView(.horizontal, showsIndicators: false)
                        {
                            LazyHGrid(rows: lightRows, spacing: 10, content: {
                                ForEach(room.lights) { light in
                                    LightView(light: light)
                                    
                                }
                            })
                        }
                        .background(Color(UIColor.systemGroupedBackground))
                        
                    }
                    .listRowBackground(Color(UIColor.systemGroupedBackground))
                    .listRowSeparator(.hidden)
                    
                    Spacer()
                        .listRowBackground(Color(UIColor.systemGroupedBackground))
                        .listRowSeparator(.hidden)
                    
                }
                .background(Color(UIColor.systemGroupedBackground))
                .listStyle(PlainListStyle()) // Liste stilini özelleştirmek için listStyle kullanın
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(UIColor.systemGroupedBackground))
                .safeAreaInset(edge: .top ) {
                    Text("")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.orange)
                }
                
                
            })
            
            
            
            
        }
        
    
    }
}
struct RoomDetailView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        RoomDetailView(room: .constant(BaseRoom.sampleData[0]))
    }
}
