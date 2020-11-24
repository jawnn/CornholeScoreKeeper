import Foundation

class Pitcher {
    
    var name: String
    var totalTosses: Int = 0
    var totalIn: Int = 0
    var totalOn: Int = 0
    var totalOff: Int = 0
    var totalFrames: Int = 0
    var totalPointsGained: Int = 0
    var totalPointsAgainst: Int = 0

    init(name: String = "") {
        self.name = name
    }
}
