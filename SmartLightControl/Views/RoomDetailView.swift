import SwiftUI

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    
    private let rows = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 0)]

    var body: some View {
        VStack(alignment: .leading) { // VStack eklendi
            Text("Appearances") // Section başlığı ScrollView dışına taşındı
                .font(.headline)
                .padding()

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
                .padding([.bottom], 10) // ScrollView alt paddingi eklendi
            }
            Spacer()
        }
    }
}
struct RoomDetailView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        RoomDetailView(room: .constant(BaseRoom.sampleData[0]))
    }
}
