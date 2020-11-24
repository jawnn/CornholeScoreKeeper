import Foundation

class Player: Pitcher {
    var matches: Archive = Archive()

    var careerRecord: Record = Record()
    var singlesRecord: Record = Record()
    var doublesRecord: Record  = Record()

    var averageBagsInPerFrame: Double = 0.0
    var averageBagsOnPerFrame: Double = 0.0
    var averageBagsOffPerFrame: Double = 0.0

    var streak: Int = 0
    var perfects: Int = 0

    override init(name: String) {
        super.init(name: name)
        self.name = name
    }

}
