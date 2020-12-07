import Foundation

protocol NewMatchModelType {
    var players: [Player] { get set }
}

class NewMatchModel: NewMatchModelType {
    var players: [Player]

    init(players: [Player]) {
        self.players = players
    }
}
