import SwiftUI

struct MainView: View {
    
    @ObservedObject var roomManager: RoomsViewModel
    @State private var activeTabIndex: Int = 1
    
    var body: some View {
        VStack {
            TabView(selection: $activeTabIndex) {
                HomeView(roomManager: roomManager)
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
        var roomManager: RoomsViewModel {
            return RoomsViewModel(rooms: BaseRoom.sampleData)
        }
        
        MainView(roomManager: roomManager)
    }
}
