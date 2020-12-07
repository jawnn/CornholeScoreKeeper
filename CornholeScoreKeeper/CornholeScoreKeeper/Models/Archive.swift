import Foundation

class Archive {
    var archive: [String: [Match]] = [MatchType.single.keyTitle: [], MatchType.doubles.keyTitle: []]
    var players: [Player] = []
}
