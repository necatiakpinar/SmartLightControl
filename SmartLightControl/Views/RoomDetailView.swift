import SwiftUI

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    
    private let rows = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(room.appearances) { appearance in
                    AppearanceView(appearance: appearance)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            
        }
    }
}

struct RoomDetailView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        RoomDetailView(room: .constant(BaseRoom.sampleData[0]))
    }
}
