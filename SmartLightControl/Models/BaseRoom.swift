import Foundation

class BaseRoom: Identifiable
{
    let id: UUID
    let name: String
    var appearances: [BaseAppearance]
    var lights: [BaseLight]
    init(id: UUID = UUID(), name: String, appearances: [BaseAppearance], lights: [BaseLight]) {
        self.id = id
        self.name = name
        self.appearances = appearances
        self.lights = lights
    }
    
}

extension BaseRoom {
    static var sampleData: [BaseRoom] =
    [
        BaseRoom(name: "Playroom", appearances: BaseAppearance.sampleData, lights: BaseLight.sampleData),
        BaseRoom(name: "Workstation", appearances: BaseAppearance.sampleData, lights: BaseLight.sampleData)
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
