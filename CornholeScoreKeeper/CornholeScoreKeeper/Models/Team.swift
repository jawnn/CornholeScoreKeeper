import Foundation

enum TeamColor: Int {
    case blue
    case red

    var title: String {
        switch self {
        case .blue:
            return "Blue"
        case .red:
            return "Red"
        }
    }
}

class Team {
    var players: [Player] = []
    var score: Int = 0
    var color: TeamColor = .blue
}
