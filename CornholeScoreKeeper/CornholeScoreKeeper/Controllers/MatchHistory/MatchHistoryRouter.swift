import UIKit

protocol MatchHistoryRouterType {
    var navigationController: UINavigationController { get set }
    func toMatchDetailsViewController()
}

class MatchHistoryRouter: MatchHistoryRouterType {

    var view: MatchHistoryViewController
    var navigationController: UINavigationController

    init(view: MatchHistoryViewController) {
        self.view = view
        self.navigationController = UINavigationController(rootViewController: view)
    }

    func toMatchDetailsViewController() {
        let viewController = MatchDetailsViewController()
        let model = MatchDetailsModel()
        let presenter = MatchDetailsPresenter(model: model, view: viewController)
        viewController.presenter = presenter
        navigationController.pushViewController(viewController, animated: true)
    }
}
