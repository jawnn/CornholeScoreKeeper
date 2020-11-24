import UIKit

protocol MatchHistoryPresenterType {

}

protocol MatchHistoryViewType {

}

class MatchHistoryPresenter: MatchHistoryPresenterType {

    var model: MatchHistoryModelType
    var view: MatchHistoryViewType

    init(model: MatchHistoryModelType, view: MatchHistoryViewType) {
        self.model = model
        self.view = view
    }

}
