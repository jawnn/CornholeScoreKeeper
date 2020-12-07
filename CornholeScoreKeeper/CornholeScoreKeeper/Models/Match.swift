import Foundation

enum MatchType: Int {
    case single, doubles

    var keyTitle: String {
        switch self {
        case .single:
            return "Single"
        case .doubles:
            return "Doubles"
        }
    }
}

class Match {
    var date: Date = Date()
    var frames: [Frame] = []
    var pitchersBox1: [Pitcher] = []
    var pitchersBox2: [Pitcher] = []
    var blueTeam: Team  = Team(players: [])
    var redTeam: Team = Team(players: [])
    var matchType: MatchType = .single
    var didWin: TeamColor = .blue
}
