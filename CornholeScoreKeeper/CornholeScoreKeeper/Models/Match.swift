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

    var totalAllowedPlayers: Int {
        switch self {
        case .single:
            return 2
        case .doubles:
            return 4
        }
    }
}

class Match {
    var date: Date = Date()
    var frames: [Frame] = []
    var pitchersBox1: [Pitcher] = []
    var pitchersBox2: [Pitcher] = []
    var didWin: TeamColor = .none
    var redTeam: Team
    var blueTeam: Team
    var matchType: MatchType

    init(redTeam: Team, blueTeam: Team, matchType: MatchType) {
        self.redTeam = redTeam
        self.blueTeam = blueTeam
        self.matchType = matchType
    }
}
