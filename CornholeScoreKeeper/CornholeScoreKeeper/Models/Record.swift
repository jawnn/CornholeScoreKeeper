import Foundation

class Record {
    var totalMatches = 0
    var wins: Int = 0
    var losses: Int = 0

    var winPercentage: Double {
        get {
            return Double(wins) / Double(totalMatches)
        }
    }
}
