import UIKit

protocol NewMatchPresenterType: UITableViewDataSource, TeamSelectViewDelegate, AddNewPlayerProfileDelegate {
    var redTeam: Team { get set }
    var blueTeam: Team { get set }
    var selectedButtonTag: Int { get set }

    func appendPlayerToTeam(index: Int, tag: Int)
}

protocol NewMatchViewType {
    func toggleTableViewVisibility()
    func reloadTableData()
}

class NewMatchPresenter: NSObject, NewMatchPresenterType {
    var model: NewMatchModelType
    var view: NewMatchViewType

    var isSelecting: Bool = false
    var selectedButtonTag: Int = 0
    var redTeam: Team = Team(color: .red)
    var blueTeam: Team = Team(color: .blue)

    init(model: NewMatchModelType, view: NewMatchViewType) {
        self.model = model
        self.view = view

        self.redTeam.players = []
        self.blueTeam.players = []
    }

    func appendPlayerToTeam(index: Int, tag: Int) {
        let pitcher = Pitcher(player: model.players[index])
        switch tag {
        case AddPitcherButtonTag.leftBlueButton.rawValue, AddPitcherButtonTag.rightBlueButton.rawValue:
            blueTeam.players.append(pitcher)
        case AddPitcherButtonTag.leftRedButton.rawValue, AddPitcherButtonTag.rightRedButton.rawValue:
            redTeam.players.append(pitcher)
        default:
            break
        }
    }

}

// MARK: - Player Select TableViewDataSource
extension NewMatchPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = model.players[indexPath.row].name
        return cell
    }

}

// MARK: - TeamSelectView Delegate
extension NewMatchPresenter {
    func placeSelectedPlayerOnTeam(tag: Int) {
        selectedButtonTag = tag
        isSelecting = true
        view.toggleTableViewVisibility()
    }
}

// MARK: - AddPlayerProfile Delegate
extension NewMatchPresenter {
    func addPlayerProfile(name: String) {
        let newPlayer = Player(name: name)
        model.players.append(newPlayer)
        view.reloadTableData()
    }
}
