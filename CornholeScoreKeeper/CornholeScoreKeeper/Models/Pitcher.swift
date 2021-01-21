import Foundation

struct Pitcher {
    var player: Player
    var inThisFrame: Int = 0
    var onThisFrame: Int = 0
    var pointsGainedThisFrame: Int = 0
    var pointsAgainstThisFrame: Int = 0

    var offThisFrame: Int {
        get {
            return 4 - (inThisFrame + onThisFrame)
        }
    }

    var frameScore: Int {
        get {
            return (self.inThisFrame * 3) + (self.onThisFrame)
        }
    }

    init(player: Player) {
        self.player = player
    }

    mutating func generateFrameStats(opponentScore: Int) {
        if self.frameScore > opponentScore {
            pointsGainedThisFrame = self.frameScore - opponentScore
        } else {
            pointsAgainstThisFrame = opponentScore - self.frameScore
        }
    }

}
