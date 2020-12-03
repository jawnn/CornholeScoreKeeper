import UIKit

protocol NewMatchPresenterType: UITableViewDataSource {

}

protocol NewMatchViewType {

}

class NewMatchPresenter: NSObject, NewMatchPresenterType {
    var view: NewMatchViewType

    init(view: NewMatchViewType) {
        self.view = view
    }
}

// MARK: - Player Select TableViewDataSource
extension NewMatchPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}
