import Foundation

class BaseLight: Identifiable
{
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
}

extension BaseLight {
    static var sampleData: [BaseLight] =
    [
        BaseLight(name: "HueLeft"),
        BaseLight(name: "HueMid1"),
        BaseLight(name: "HueMid2"),
        BaseLight(name: "HueRight"),
    ]
    
    static let emptyData: [BaseLight] = []
    
}


extension BaseLight: Equatable {
    
    static func == (lhs: BaseLight, rhs: BaseLight) -> Bool {
        return lhs.id == rhs.id
    }
}

extension BaseLight: Comparable {
    
    static func < (lhs: BaseLight, rhs: BaseLight) -> Bool {
        return lhs.name < rhs.name
    }
}
