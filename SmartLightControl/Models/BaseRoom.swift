import Foundation

class BaseRoom: Identifiable
{
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
}

extension BaseRoom {
    static var sampleData: [BaseRoom] =
    [
        BaseRoom(name: "Playroom"),
        BaseRoom(name: "Workstation")
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
