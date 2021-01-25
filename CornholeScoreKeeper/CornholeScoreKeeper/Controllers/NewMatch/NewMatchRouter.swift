import UIKit

protocol NewMatchRouterType {
    var navigationController: UINavigationController { get set }
    func toCurrentMatchViewController(redTeam: Team, blueTeam: Team, matchType: MatchType)
}

class NewMatchRouter: NewMatchRouterType {
    var navigationController: UINavigationController
    let view: NewMatchViewController

    init(view: NewMatchViewController) {
        self.view = view
        self.navigationController = UINavigationController(rootViewController: view)
    }

    func toCurrentMatchViewController(redTeam: Team, blueTeam: Team, matchType: MatchType) {
        let viewController = CurrentMatchViewController()
        let model = CurrentMatchModel(match: Match(redTeam: redTeam, blueTeam: blueTeam, matchType: matchType))
        let presenter = CurrentMatchPresenter(model: model, view: viewController)
        viewController.modalPresentationStyle = .fullScreen
        viewController.presenter = presenter
        self.view.present(viewController, animated: true)
//        navigationController.pushViewController(viewController, animated: true)
    }
}
