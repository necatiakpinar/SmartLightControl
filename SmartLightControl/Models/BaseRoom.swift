import Foundation

class BaseRoom: Identifiable
{
    let id: UUID
    let name: String
    var appearances: [BaseAppearance]
    init(id: UUID = UUID(), name: String, appearances: [BaseAppearance]) {
        self.id = id
        self.name = name
        self.appearances = appearances
    }
    
}

extension BaseRoom {
    static var sampleData: [BaseRoom] =
    [
        BaseRoom(name: "Playroom", appearances: BaseAppearance.sampleData),
        BaseRoom(name: "Workstation", appearances: BaseAppearance.sampleData)
    ]
    
    static let emptyData: [BaseRoom] = []
    
}


extension BaseRoom: Equatable {
    
    static func == (lhs: BaseRoom, rhs: BaseRoom) -> Bool {
        return lhs.id == rhs.id
    }
}

extension BaseRoom: Comparable {
    
    static func < (lhs: BaseRoom, rhs: BaseRoom) -> Bool {
        return lhs.name < rhs.name
    }
}
