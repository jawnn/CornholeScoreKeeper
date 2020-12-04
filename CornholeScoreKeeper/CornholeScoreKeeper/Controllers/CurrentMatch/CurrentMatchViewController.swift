import UIKit

class CurrentMatchViewController: UIViewController {

    private weak var matchScoreSection: MatchScoreView!
    private weak var turnIndicatorView: TurnIndicatorView!
    private weak var completeRoundButton: UIButton!

    var presenter: CurrentMatchPresenterType!

    override func loadView() {
        super.loadView()

        let matchScoreView = MatchScoreView(frame: .zero)
        let turnIndicatorView = TurnIndicatorView(frame: .zero)
        let completeRoundButton = UIButton(frame: .zero)
        completeRoundButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews(matchScoreView, turnIndicatorView, completeRoundButton)

        NSLayoutConstraint.activate([
            matchScoreView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            matchScoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            matchScoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),

            turnIndicatorView.bottomAnchor.constraint(equalTo: completeRoundButton.topAnchor, constant: -16),
            turnIndicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            turnIndicatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            turnIndicatorView.heightAnchor.constraint(equalToConstant: 200),

            completeRoundButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            completeRoundButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            completeRoundButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            completeRoundButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        self.matchScoreSection = matchScoreView
        self.turnIndicatorView = turnIndicatorView
        self.completeRoundButton = completeRoundButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        turnIndicatorView.delegate = presenter
        matchScoreSection.backgroundColor = .systemGray5
        matchScoreSection.layer.cornerRadius = 10

        turnIndicatorView.backgroundColor = .systemGray5
        turnIndicatorView.layer.cornerRadius = 10
        view.backgroundColor = .white

        configureRoundCompleteButton()
    }

    private func configureRoundCompleteButton() {
        completeRoundButton.setTitle("Complete Round", for: .normal)
        completeRoundButton.backgroundColor = .systemGray3
        completeRoundButton.addTarget(self, action: #selector(didTapCompleteRoundButton), for: .touchUpInside)
    }

    @objc func didTapCompleteRoundButton() {
        
    }

}

extension CurrentMatchViewController: CurrentMatchViewType {
    func updateScoreLabel(tag: Int) {
        switch tag {
        case IncrementScoreButton.blueUndoOnButton.rawValue:
            matchScoreSection.blueFrameScoreLabel.text = "-1"
        case IncrementScoreButton.blueOnButton.rawValue:
            matchScoreSection.blueFrameScoreLabel.text = "1"
        case IncrementScoreButton.blueUndoInButton.rawValue:
            matchScoreSection.blueFrameScoreLabel.text = "-3"
        case IncrementScoreButton.blueInButton.rawValue:
            matchScoreSection.blueFrameScoreLabel.text = "3"
        case IncrementScoreButton.redUndoOnButton.rawValue:
            matchScoreSection.redFrameScoreLabel.text = "-1"
        case IncrementScoreButton.redOnButton.rawValue:
            matchScoreSection.redFrameScoreLabel.text = "1"
        case IncrementScoreButton.redUndoInButton.rawValue:
            matchScoreSection.redFrameScoreLabel.text = "-3"
        case IncrementScoreButton.redInButton.rawValue:
            matchScoreSection.redFrameScoreLabel.text = "3"
        default:
            break
        }
    }
}
