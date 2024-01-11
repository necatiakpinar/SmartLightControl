import Foundation
import Combine

class RoomsViewModel: ObservableObject {
    @Published var rooms: [BaseRoom] = []
    
    init(rooms: [BaseRoom]) {
        self.rooms = rooms
    }
    
    func addAppearance(room: BaseRoom, appearance: BaseAppearance)
    {
        if (room.appearances.contains(appearance)) {
            return
        }
        
        room.appearances.append(appearance)
        print("\(appearance.name) has been ADDED to your collection!")
        
    }
    
    func removeGame(room: BaseRoom, appearance: BaseAppearance) {
        if let index = room.appearances.firstIndex(of: appearance) {
            room.appearances.remove(at: index)
            print("\(appearance.name) has been REMOVED to your collection!")
        }
    }
    
    func hasGame(room: BaseRoom, appearance: BaseAppearance) -> Bool {
        return room.appearances.contains(appearance)
    }
}
