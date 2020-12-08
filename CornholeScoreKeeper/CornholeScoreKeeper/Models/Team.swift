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
    var color: TeamColor = .none
    var players: [Pitcher] = []

    init(players: [Pitcher]) {
        self.players = players
    }
}
