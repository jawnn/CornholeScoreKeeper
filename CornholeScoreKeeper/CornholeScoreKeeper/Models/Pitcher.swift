import Foundation

class Pitcher {
    var player: Player
    var frames: [FrameStat] = []

    var totalScore: Int = 0
    var totalOnBoard: Int = 0
    var totalOffBoard: Int = 0
    var totalCornholes: Int = 0
    var matchPlusMinus: Int = 0

    var averageScore: Int {
        return self.totalScore / self.frames.count
    }

    var efficientcyRating: Double {
        let totalTosses = Double(frames.count * 4)
        let perfectScore = Double(totalTosses * 3)
        return Double(totalScore) / perfectScore
    }

    init(player: Player) {
        self.player = player
    }

    func incrementStats(with frame: FrameStat) {
        totalScore += frame.score
        totalOnBoard += frame.onBoard
        totalOffBoard += frame.offBoard
        totalCornholes += frame.cornholes
        matchPlusMinus += frame.plusMinus
        frames.append(frame)
    }

}
