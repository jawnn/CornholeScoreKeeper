import UIKit

protocol NewMatchPresenterType {

}

protocol NewMatchViewType {

}

class NewMatchPresenter: NewMatchPresenterType {
    var view: NewMatchViewType

    init(view: NewMatchViewType) {
        self.view = view
    }
}
