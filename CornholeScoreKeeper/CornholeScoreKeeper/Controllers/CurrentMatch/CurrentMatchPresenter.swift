import UIKit

protocol CurrentMatchPresenterType: IncrementScoreDelegate {

}

protocol CurrentMatchViewType {
    func updateScoreLabel(tag: Int)
}

class CurrentMatchPresenter: CurrentMatchPresenterType {
    var view: CurrentMatchViewType

    init(view: CurrentMatchViewType) {
        self.view = view
    }
}

extension CurrentMatchPresenter {
    func incrementScoreAndUpdateLabel(tag: Int) {
        view.updateScoreLabel(tag: tag)
    }
}

