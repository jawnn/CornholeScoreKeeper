import UIKit

class MatchHistoryViewController: UIViewController {

    var presenter: MatchHistoryPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGreen
    }

}

extension MatchHistoryViewController: MatchHistoryViewType {
    
}
