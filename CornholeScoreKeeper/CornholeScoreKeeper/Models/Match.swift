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
    var didWin: TeamColor = .none
    var redTeam: Team
    var blueTeam: Team
    var matchType: MatchType

    var currentFrameNumber: Int = 1

    var currentPitcherIndex: Int {
        get {
            if self.matchType == .single {
                return 0
            } else {
                return self.currentFrameNumber % 2 == 0 ? 0 : 1
            }
        }
    }

    init(redTeam: Team, blueTeam: Team, matchType: MatchType) {
        self.redTeam = redTeam
        self.blueTeam = blueTeam
        self.matchType = matchType

        self.frames = [
            Frame(frame: currentFrameNumber, bluePitcher: blueTeam.players[currentPitcherIndex],
                  redPitcher: redTeam.players[currentPitcherIndex]
            )
        ]
    }

    func generateMatchSore(scoringTeam: TeamColor, points: Int) {
        switch scoringTeam {
        case .blue:
            blueTeam.score += points
        case .red:
            redTeam.score += points
        case .none:
            break
        }
    }
}
