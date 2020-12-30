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
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FrameTableCell.self)) as? FrameTableCell else {
            return UITableViewCell()
        }
        return cell
    }
}

extension CurrentMatchPresenter {
    func didTapBagOutcomeButton(tag: Int) {
        view.updateScoreLabel(tag: tag)
    }
}

