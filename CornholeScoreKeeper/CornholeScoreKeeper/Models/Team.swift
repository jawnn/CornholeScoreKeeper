import Foundation

enum TeamColor: Int {
    case blue
    case red
    case none

    var title: String {
        switch self {
        case .blue:
            return "Blue"
        case .red:
            return "Red"
        default:
            return "None"
        }
    }
}

class Team {
    var score: Int = 0
    var players: [Pitcher] = []
    var color: TeamColor

    init(color: TeamColor) {
        self.color = color
    }
}
