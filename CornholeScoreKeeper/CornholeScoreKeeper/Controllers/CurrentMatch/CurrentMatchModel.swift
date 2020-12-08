import Foundation

protocol CurrentMatchModelType {
    var currentMatch: Match { get set }
}

class CurrentMatchModel: CurrentMatchModelType {
    var currentMatch: Match

    init(match: Match) {
        self.currentMatch = match
    }

}
