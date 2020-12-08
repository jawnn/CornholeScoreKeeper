import Foundation

protocol MatchDetailsPresenterType {

}

protocol MatchDetailsViewType {

}

class MatchDetailsPresenter: MatchDetailsPresenterType {

    var model: MatchDetailsModelType
    var view: MatchDetailsViewType

    init(model: MatchDetailsModelType, view: MatchDetailsViewType) {
        self.model = model
        self.view = view
    }
}
