import Foundation

class BaseAppearance: Identifiable
{
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
}

extension BaseAppearance {
    static var sampleData: [BaseAppearance] =
    [
        BaseAppearance(name: "CosyMood"),
        BaseAppearance(name: "Fifa"),
        BaseAppearance(name: "Test"),
        BaseAppearance(name: "Halloween"),
        BaseAppearance(name: "Alan Wake 2"),
        BaseAppearance(name: "Space"),
        BaseAppearance(name: "Boxing"),
        BaseAppearance(name: "Gaming"),
        BaseAppearance(name: "Friends")
    ]
    
    static let emptyData: [BaseAppearance] = []
    
}


extension BaseAppearance: Equatable {
    
    static func == (lhs: BaseAppearance, rhs: BaseAppearance) -> Bool {
        return lhs.id == rhs.id
    }
}

extension BaseAppearance: Comparable {
    
    static func < (lhs: BaseAppearance, rhs: BaseAppearance) -> Bool {
        return lhs.name < rhs.name
    }
}
