import UIKit

protocol NewMatchRouterType {
    var navigationController: UINavigationController { get set }
    func toCurrentMatchViewController()
}

class NewMatchRouter: NewMatchRouterType {
    var navigationController: UINavigationController
    let view: NewMatchViewController

    init(view: NewMatchViewController) {
        self.view = view
        self.navigationController = UINavigationController(rootViewController: view)
    }

    func toCurrentMatchViewController() {
        let viewController = CurrentMatchViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
