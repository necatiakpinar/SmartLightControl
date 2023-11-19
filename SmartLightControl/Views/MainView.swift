import SwiftUI

struct MainView: View {
    
    @State private var activeTabIndex: Int = 1
    
    var body: some View {
        VStack {
            TabView(selection: $activeTabIndex) {
                HomeView()
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
        MainView()
    }
}
