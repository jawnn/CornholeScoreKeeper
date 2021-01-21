import Foundation

protocol CurrentMatchModelType {
    var currentMatch: Match { get set }
    var blueTeam: Team { get set }
    var redTeam: Team { get set }
    var currentFrameNumber: Int { get set }
    var currentPitcherIndex: Int { get set }
    var currentFrame: Frame { get set }
}

class CurrentMatchModel: CurrentMatchModelType {
    var blueTeam: Team
    var redTeam: Team
    var currentFrameNumber: Int
    var currentPitcherIndex: Int
    var currentFrame: Frame
    var currentMatch: Match

    init(match: Match) {
        let red = Team(color: .red)
        red.players = [
            Pitcher(player: Player(name: "Red1"))
        ]
        let blue = Team(color: .blue)
        blue.players = [
            Pitcher(player: Player(name: "Blue1"))
        ]
        self.currentMatch = Match(redTeam: red, blueTeam: blue, matchType: .single)
        self.blueTeam = self.currentMatch.blueTeam
        self.redTeam = self.currentMatch.redTeam
        self.currentFrameNumber = self.currentMatch.currentFrameNumber
        self.currentPitcherIndex = self.currentMatch.currentPitcherIndex
        self.currentFrame = self.currentMatch.frames[self.currentFrameNumber - 1]
    }


}
