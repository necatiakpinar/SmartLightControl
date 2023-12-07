import SwiftUI

struct HomeView: View {
    @Binding var rooms: [BaseRoom]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Rooms")) {
                    ForEach($rooms) { $room in
                        ZStack {
                            RoomCardView(room: $room)
                            
                            NavigationLink(destination: RoomDetailView(room: $room)) {
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
        HomeView(rooms: .constant(BaseRoom.sampleData))
    }
}

