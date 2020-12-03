import UIKit

protocol NewMatchPresenterType: UITableViewDataSource, TeamSelectViewDelegate {
    var selectedButtonTag: Int { get set }
}

protocol NewMatchViewType {
    func toggleTableViewVisibility()
}

class NewMatchPresenter: NSObject, NewMatchPresenterType {
    var model: NewMatchModelType
    var view: NewMatchViewType

    var selectedButtonTag: Int = 0
    var isSelecting: Bool = false

    init(model: NewMatchModelType, view: NewMatchViewType) {
        self.model = model
        self.view = view
    }
}

// MARK: - Player Select TableViewDataSource
extension NewMatchPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = model.players[indexPath.row]
        return cell
    }

}

extension NewMatchPresenter {
    func placeSelectedPlayerOnTeam(tag: Int) {
        selectedButtonTag = tag
        isSelecting = true
        view.toggleTableViewVisibility()
    }
}
