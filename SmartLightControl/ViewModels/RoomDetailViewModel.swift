import Foundation
import Combine

class RoomDetailViewModel {
    @Published var appearances: [BaseAppearance] = []
    
    init(appearances: [BaseAppearance]) {
        self.appearances = appearances
    }
    
    func addAppearance(appearance: BaseAppearance)
    {
        if (appearances.contains(appearance)) {
            return
        }
        
        appearances.append(appearance)
        print("\(appearance.name) has been ADDED to your collection!")
        
    }
    
    func removeGame(appearance: BaseAppearance) {
        if let index = appearances.firstIndex(of: appearance) {
            appearances.remove(at: index)
            print("\(appearance.name) has been REMOVED to your collection!")
        }
    }
    
    func hasGame(appearance: BaseAppearance) -> Bool {
        return appearances.contains(appearance)
    }
}
