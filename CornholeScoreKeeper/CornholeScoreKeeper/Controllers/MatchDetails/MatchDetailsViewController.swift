import UIKit

class MatchDetailsViewController: UIViewController {

    var presenter: MatchDetailsPresenterType!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemIndigo
    }

}

extension MatchDetailsViewController: MatchDetailsViewType {
    
}
