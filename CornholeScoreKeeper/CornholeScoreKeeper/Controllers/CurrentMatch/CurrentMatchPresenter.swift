import UIKit

protocol CurrentMatchPresenterType: UITableViewDataSource, IncrementScoreDelegate {

}

protocol CurrentMatchViewType {
    func updateScoreLabel(tag: Int)
}

class CurrentMatchPresenter: NSObject, CurrentMatchPresenterType {
    var view: CurrentMatchViewType
    var model: CurrentMatchModelType

    init(model: CurrentMatchModelType, view: CurrentMatchViewType) {
        self.model = model
        self.view = view
    }
}

extension CurrentMatchPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "1234"
        return cell
    }
}

extension CurrentMatchPresenter {
    func incrementScoreAndUpdateLabel(tag: Int) {
        view.updateScoreLabel(tag: tag)
    }
}

