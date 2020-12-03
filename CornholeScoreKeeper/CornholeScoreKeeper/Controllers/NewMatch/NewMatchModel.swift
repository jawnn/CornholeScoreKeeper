import Foundation

protocol NewMatchModelType {
    var players: [String] { get set }
}

class NewMatchModel: NewMatchModelType {
    var players: [String]

    init(players: [String]) {
        self.players = players
    }
}
