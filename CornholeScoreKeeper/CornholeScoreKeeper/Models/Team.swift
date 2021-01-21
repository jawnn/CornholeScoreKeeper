import UIKit

enum TeamColor: Int {
    case blue
    case red
    case none

    var title: String {
        switch self {
        case .blue:
            return "Blue"
        case .red:
            return "Red"
        default:
            return "None"
        }
    }

    var color: UIColor {
        switch self {
        case .blue:
            return UIColor.systemBlue
        case .red:
            return UIColor.systemRed
        default:
            return UIColor.systemGray5
        }
    }
}

class Team {
    var score: Int = 0
    var players: [Pitcher] = []
    var color: TeamColor

    init(color: TeamColor) {
        self.color = color
    }
}
