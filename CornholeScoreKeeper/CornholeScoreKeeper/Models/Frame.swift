import Foundation

class Frame {
    var frameNumber: Int
    var blueFrame: FrameStat
    var redFrame: FrameStat

    var scoringTeam: TeamColor = .none

    init(frame: Int, bluePitcher: FrameStat, redPitcher: FrameStat) {
        self.frameNumber = frame
        self.blueFrame = bluePitcher
        self.redFrame = redPitcher
    }

    func generatePlusMinus() -> Int {
        guard scoringTeam != .none else {
            return 0
        }
        return max(blueFrame.plusMinus, redFrame.plusMinus)
    }

    func generateFrameScore() -> Int {
        let blueScore = blueFrame.score
        let redScore = redFrame.score
        guard blueScore != redScore else {
            return 0
        }
        self.blueFrame.plusMinus = blueScore - redScore
        self.redFrame.plusMinus = redScore - blueScore
        self.scoringTeam = blueScore > redScore ? .blue : .red
        return max(self.blueFrame.plusMinus, redFrame.plusMinus)
    }

}

struct FrameStat {
    var onBoard: Int = 0
    var cornholes: Int = 0
    var plusMinus = 0

    var offBoard: Int {
        get {
            return 4 - (self.cornholes + self.onBoard)
        }
    }

    var score: Int {
        get {
            return (self.cornholes * 3) + (self.onBoard)
        }
    }
}
