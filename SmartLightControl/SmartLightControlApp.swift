//
//  SmartLightControlApp.swift
//  SmartLightControl
//
//  Created by Necati Akpınar on 18.11.2023.
//

import SwiftUI

@main
struct SmartLightControlApp: App {
    var body: some Scene {
        
        var userRooms: RoomsViewModel {
            return RoomsViewModel(rooms: BaseRoom.sampleData)
        }
        
        WindowGroup {
            MainView(rooms: userRooms)
        }
    }
}
