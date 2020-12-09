import UIKit

protocol CurrentMatchPresenterType: IncrementScoreDelegate {

}

protocol CurrentMatchViewType {
    func updateScoreLabel(tag: Int)
}

class CurrentMatchPresenter: CurrentMatchPresenterType {
    var view: CurrentMatchViewType
    var model: CurrentMatchModelType

    init(model: CurrentMatchModelType, view: CurrentMatchViewType) {
        self.model = model
        self.view = view
    }
}

extension CurrentMatchPresenter {
    func incrementScoreAndUpdateLabel(tag: Int) {
        view.updateScoreLabel(tag: tag)
    }
}

