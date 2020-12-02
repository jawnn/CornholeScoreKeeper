import UIKit

class CurrentMatchViewController: UIViewController {

    private weak var matchScoreSection: MatchScoreView!

    override func loadView() {
        super.loadView()

        let matchScoreView = MatchScoreView(frame: .zero)
        view.addSubview(matchScoreView)
        NSLayoutConstraint.activate([
            matchScoreView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            matchScoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            matchScoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])

        self.matchScoreSection = matchScoreView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        matchScoreSection.backgroundColor = .systemGray5
        matchScoreSection.layer.cornerRadius = 10
        view.backgroundColor = .white
    }

}
