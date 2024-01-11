import SwiftUI

struct HomeView: View {
    @StateObject var roomManager: RoomsViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Rooms")) {
                    ForEach($roomManager.rooms) { $room in
                        ZStack {
                            RoomCardView(room: $room)
                            
                            NavigationLink(destination: RoomDetailView(room: $room, roomManager: roomManager)) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                        }
                        .background(Color.clear) // Make sure the back
                        
                    }
                }
                .listRowInsets(EdgeInsets())
            
            }
            .navigationTitle("Home")
            
            
        }
        // Background color should be applied to the List or NavigationView
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        var roomManager: RoomsViewModel {
            return RoomsViewModel(rooms: BaseRoom.sampleData)
        }
        HomeView(roomManager: roomManager)
    }
}

