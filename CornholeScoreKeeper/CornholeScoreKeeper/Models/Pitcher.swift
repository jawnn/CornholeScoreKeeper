import Foundation

enum BagOutcome: Int {
    case off, woody, cornhole
}

class Pitcher {
    var player: Player
    var tossOutcomes: [BagOutcome] = [.off, .off, .off, .off]
    var frameScore: Int = 0
    var inThisFrame: Int = 0
    var onThisFrame: Int = 0
    var offThisFrame: Int = 0
    var pointsGainedThisFrame: Int = 0
    var pointsAgainstThisFrame: Int = 0

    init(player: Player) {
        self.player = player
    }

    func generateFrameScore() {
        self.frameScore = (self.inThisFrame * 3) + (self.onThisFrame)
    }
}
