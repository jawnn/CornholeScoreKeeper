import UIKit

protocol MatchHistoryPresenterType: UITableViewDataSource {

}

protocol MatchHistoryViewType {

}

class MatchHistoryPresenter: NSObject, MatchHistoryPresenterType {

    var model: MatchHistoryModelType
    var view: MatchHistoryViewType

    init(model: MatchHistoryModelType, view: MatchHistoryViewType) {
        self.model = model
        self.view = view
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
