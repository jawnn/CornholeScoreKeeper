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
        let presenter = CurrentMatchPresenter(view: viewController)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: true)
    }
}
