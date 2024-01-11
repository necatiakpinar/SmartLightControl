import SwiftUI

struct MainView: View {
    
    @ObservedObject var rooms: RoomsViewModel
    @State private var activeTabIndex: Int = 1
    
    var body: some View {
        VStack {
            TabView(selection: $activeTabIndex) {
                HomeView(rooms: $rooms.rooms)
                    .tabItem { Text("Home") }
                    .tag(1)
                SettingsView()
                    .tabItem { Text("Settings") }
                    .tag(2)
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
}


struct MainView_Previews: PreviewProvider {

    static var previews: some View {
        var userRooms: RoomsViewModel {
            return RoomsViewModel(rooms: BaseRoom.sampleData)
        }
        
        MainView(rooms: userRooms)
    }
}
