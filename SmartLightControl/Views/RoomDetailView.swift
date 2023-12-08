import SwiftUI

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    
    private let rows = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 0)]
    
    var body: some View {
        VStack(alignment: .leading) { // VStack eklendi
            
            List {
                Section(header:Text("Appearances"))
                {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows, spacing: 10) {
                            ForEach(room.appearances) { appearance in
                                AppearanceView(appearance: appearance)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray)
                                    .cornerRadius(10)
                            }
                        }
                        //.padding([.bottom], ) // ScrollView alt paddingi eklendi
                    }
                }
                .listRowBackground(Color.clear)
                
                
                Text("test")
                    .padding()
                    .listRowBackground(Color.clear)
                
                
            }
            
            
            
        }
    }
}
struct RoomDetailView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        RoomDetailView(room: .constant(BaseRoom.sampleData[0]))
    }
}
