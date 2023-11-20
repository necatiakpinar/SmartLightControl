import SwiftUI

struct HomeView: View {
    @Binding var rooms: [BaseRoom]
    
    var body: some View {
        NavigationView {
            
            List {
                Section(header: Text("Rooms")) {
                    ForEach($rooms) { $room in
                        RoomCardView(room: $room)
                    
                    }
                    
                }
                .listRowInsets(EdgeInsets())
             
            }
            .navigationTitle("Home")
        }
        .background(Color.red) // Set the background color here
        
    }
}


struct HomesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(rooms: .constant(BaseRoom.sampleData))
    }
}
