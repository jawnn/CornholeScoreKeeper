import Foundation

class Player {
    var name: String

    var matches: Archive = Archive()
    var careerRecord: Record = Record()
    var singlesRecord: Record = Record()
    var doublesRecord: Record  = Record()

    var totalFrames: Int = 0
    var totalTosses: Int = 0
    var totalIn: Int = 0
    var totalOn: Int = 0
    var totalOff: Int = 0
    var totalPointsGained: Int = 0
    var totalPointsAgainst: Int = 0

    var averageBagsInPerFrame: Double = 0.0
    var averageBagsOnPerFrame: Double = 0.0
    var averageBagsOffPerFrame: Double = 0.0

    var streak: Int = 0
    var perfects: Int = 0

    init(name: String) {
        self.name = name
    }
}
