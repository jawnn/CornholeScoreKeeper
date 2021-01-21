import Foundation

protocol CurrentMatchModelType {
    var currentMatch: Match { get set }
    var blueTeam: Team { get set }
    var redTeam: Team { get set }
    var currentFrameNumber: Int { get set }
    var currentPitcherIndex: Int { get }
    var currentFrame: Frame { get set }
    var bluePitcher: Pitcher { get set }
    var redPitcher: Pitcher { get set }
}

class CurrentMatchModel: CurrentMatchModelType {
    var blueTeam: Team
    var redTeam: Team
    var currentFrameNumber: Int
    var currentFrame: Frame
    var currentMatch: Match
    var bluePitcher: Pitcher
    var redPitcher: Pitcher

    var currentPitcherIndex: Int {
        get {
            return self.currentMatch.currentPitcherIndex
        }
    }

    init(match: Match) {
        let red = Team(color: .red)
        red.players = [
            Pitcher(player: Player(name: "Red1")),
            Pitcher(player: Player(name: "Red2"))
        ]
        let blue = Team(color: .blue)
        blue.players = [
            Pitcher(player: Player(name: "Blue1")),
            Pitcher(player: Player(name: "Blue2"))
        ]
        self.currentMatch = Match(redTeam: red, blueTeam: blue, matchType: .doubles)
        self.blueTeam = self.currentMatch.blueTeam
        self.redTeam = self.currentMatch.redTeam
        self.currentFrameNumber = self.currentMatch.currentFrameNumber
        self.bluePitcher = self.blueTeam.players[self.currentMatch.currentPitcherIndex]
        self.redPitcher = self.redTeam.players[self.currentMatch.currentPitcherIndex]
        self.currentFrame = Frame(frame: self.currentMatch.currentFrameNumber, bluePitcher: self.bluePitcher, redPitcher: self.redPitcher)
    }


}
