import SwiftUI

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    
    private let rows = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        VStack(alignment: .leading) {
            
                Section(header:Text("Appearances"))
                {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows, spacing: 10) {
                            ForEach(room.appearances) { appearance in
                                AppearanceView(appearance: appearance)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .frame(height: 300)
                    .background(Color(UIColor.systemGroupedBackground))
                    
                }
                
                
            
            List {
                Section(header:Text("Lights"))
                {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows, spacing: 10) {
                            ForEach(room.appearances) { appearance in
                                AppearanceView(appearance: appearance)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .listRowBackground(Color.clear)
                
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
