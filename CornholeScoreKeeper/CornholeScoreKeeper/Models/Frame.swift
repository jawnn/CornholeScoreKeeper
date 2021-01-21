import Foundation

class Frame {
    var frameNumber: Int
    var bluePitcher: Pitcher
    var redPitcher: Pitcher

    var scoringTeam: TeamColor = .none

    init(frame: Int, bluePitcher: Pitcher, redPitcher: Pitcher) {
        self.frameNumber = frame
        self.bluePitcher = bluePitcher
        self.redPitcher = redPitcher
    }

    func generatePlusMinus() -> Int {
        guard scoringTeam != .none else {
            return 0
        }
        return max(bluePitcher.pointsGainedThisFrame, redPitcher.pointsGainedThisFrame)
    }

    func generateFrameScore() -> Int {
        let blueScore = bluePitcher.frameScore
        let redScore = redPitcher.frameScore
        guard blueScore != redScore else {
            return 0
        }
        self.scoringTeam = blueScore > redScore ? .blue : .red
        bluePitcher.generateFrameStats(opponentScore: redScore)
        redPitcher.generateFrameStats(opponentScore: blueScore)
        return max(bluePitcher.pointsGainedThisFrame, redPitcher.pointsGainedThisFrame)
    }

}
