import Foundation

class Frame {
    var bluePitcher: Pitcher
    var redPitcher: Pitcher

    var scoringTeam: TeamColor = .none

    init(bluePitcher: Pitcher, redPitcher: Pitcher) {
        self.bluePitcher = bluePitcher
        self.redPitcher = redPitcher

        self.bluePitcher.generateFrameScore()
        self.redPitcher.generateFrameScore()
        self.scoringTeam = generateFrameScore()
    }

    private func generateFrameScore() -> TeamColor {
        let blueScore = bluePitcher.frameScore
        let redScore = redPitcher.frameScore
        guard blueScore != redScore else {
            return .none
        }
        return blueScore > redScore ? .blue : .red
    }
}
