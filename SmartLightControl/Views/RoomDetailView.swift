import SwiftUI

struct DraggableItem: Identifiable {
    let id: UUID
    var text: String
}

struct DropViewDelegate: DropDelegate {
    let item: DraggableItem
    @Binding var items: [DraggableItem]

    func performDrop(info: DropInfo) -> Bool {
        // Handle the drop logic here
        return true
    }
}

struct RoomDetailView: View {
    @Binding var room: BaseRoom
    @State private var items: [DraggableItem] = [
           .init(id: UUID(), text: "Item 1"),
           .init(id: UUID(), text: "Item 2"),
           .init(id: UUID(), text: "Item 3"),
           // Add more items as needed
       ]

       private let rows = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        List {
            Section(header: Text("Appearances"))
            {
                LazyHGrid(rows: rows, spacing: 20) {
                    ForEach(room.appearances) { appearance in
                        AppearanceView(appearance: appearance)
                              .padding()
                              .frame(maxWidth: .infinity)
                              .background(Color.gray)
                              .cornerRadius(10)
                              .onDrag {
                                  return NSItemProvider(object: appearance.name as NSString)
                              }
//                              .onDrop(of: [.text], delegate: DropViewDelegate(item: appearance, items: $room.appearances))
                      }
                  }
                  .padding()
            }
            .listRowInsets(EdgeInsets())

        }
        
    }
}

struct RoomDetailView_PreviewProvider: PreviewProvider{
    static var previews: some View {
        RoomDetailView(room: .constant(BaseRoom.sampleData[0]))
    }
}
