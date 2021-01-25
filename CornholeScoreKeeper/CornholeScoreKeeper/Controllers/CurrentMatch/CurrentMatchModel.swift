import Foundation

protocol CurrentMatchModelType {
    var redTeam: Team { get set }
    var blueTeam: Team { get set }
    var redPitcher: Pitcher { get set }
    var bluePitcher: Pitcher { get set }
    var currentFrame: Frame { get set }
    var currentMatch: Match { get set }
    var currentFrameNumber: Int { get set }
    var currentPitcherIndex: Int { get }
}

class CurrentMatchModel: CurrentMatchModelType {
    var redTeam: Team
    var blueTeam: Team
    var redPitcher: Pitcher
    var bluePitcher: Pitcher
    var currentFrame: Frame
    var currentMatch: Match
    var currentFrameNumber: Int
    var currentPitcherIndex: Int {
        get {
            return self.currentMatch.currentPitcherIndex
        }
    }

    init(match: Match) {
        self.currentMatch = Match(redTeam: match.redTeam, blueTeam: match.blueTeam, matchType: match.matchType)
        self.blueTeam = self.currentMatch.blueTeam
        self.bluePitcher = self.currentMatch.blueTeam.players[self.currentMatch.currentPitcherIndex]
        self.redTeam = self.currentMatch.redTeam
        self.redPitcher = self.currentMatch.redTeam.players[self.currentMatch.currentPitcherIndex]
        self.currentFrameNumber = self.currentMatch.currentFrameNumber
        self.currentFrame = Frame(frame: self.currentFrameNumber, bluePitcher: FrameStat(), redPitcher: FrameStat())
    }


}
