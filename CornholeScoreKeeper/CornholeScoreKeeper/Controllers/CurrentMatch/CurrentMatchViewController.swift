import UIKit

class CurrentMatchViewController: UIViewController {

    private weak var matchScoreSection: MatchScoreView!
    private weak var frameHistoryTableView: UITableView!
    private weak var turnIndicatorSectionView: TurnIndicationSectionView!
    private weak var bagTossOutcomeSectionView: BagTossOutcomeSectionView!
    private weak var completeRoundButton: UIButton!

    var presenter: CurrentMatchPresenterType!

    override func loadView() {
        super.loadView()

        let matchScoreView = MatchScoreView(frame: .zero)
        let frameHistoryTableView = UITableView(frame: .zero)
        let turnIndicatorSectionView = TurnIndicationSectionView(frame: .zero)
        let bagTossOutcomeSectionView = BagTossOutcomeSectionView(frame: .zero)
        let completeRoundButton = UIButton(frame: .zero)

        frameHistoryTableView.translatesAutoresizingMaskIntoConstraints = false
        completeRoundButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews(matchScoreView, frameHistoryTableView, turnIndicatorSectionView, bagTossOutcomeSectionView, completeRoundButton)

        NSLayoutConstraint.activate([
            matchScoreView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            matchScoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            matchScoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),

            frameHistoryTableView.heightAnchor.constraint(equalToConstant: 100),
            frameHistoryTableView.topAnchor.constraint(equalTo: matchScoreView.bottomAnchor, constant: 8),
            frameHistoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            frameHistoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),

            turnIndicatorSectionView.heightAnchor.constraint(equalToConstant: 100),
            turnIndicatorSectionView.topAnchor.constraint(equalTo: frameHistoryTableView.bottomAnchor, constant: 8),
            turnIndicatorSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            turnIndicatorSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),

            bagTossOutcomeSectionView.heightAnchor.constraint(equalToConstant: 200),
            bagTossOutcomeSectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            bagTossOutcomeSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            bagTossOutcomeSectionView.bottomAnchor.constraint(equalTo: completeRoundButton.topAnchor, constant: -16),

            completeRoundButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            completeRoundButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            completeRoundButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            completeRoundButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        self.matchScoreSection = matchScoreView
        self.frameHistoryTableView = frameHistoryTableView
        self.turnIndicatorSectionView = turnIndicatorSectionView
        self.bagTossOutcomeSectionView = bagTossOutcomeSectionView
        self.completeRoundButton = completeRoundButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureFrameHistoryTableView()
        bagTossOutcomeSectionView.delegate = presenter
        matchScoreSection.backgroundColor = .systemGray5
        matchScoreSection.layer.cornerRadius = 10

        bagTossOutcomeSectionView.backgroundColor = .systemGray5
        bagTossOutcomeSectionView.layer.cornerRadius = 10
        view.backgroundColor = .white

        configureRoundCompleteButton()
    }

    private func configureFrameHistoryTableView() {
        frameHistoryTableView.backgroundColor = .blue
        frameHistoryTableView.dataSource = presenter
        frameHistoryTableView.delegate = self
    }

    private func configureRoundCompleteButton() {
        completeRoundButton.setTitle("Complete Round", for: .normal)
        completeRoundButton.backgroundColor = .systemGray3
        completeRoundButton.addTarget(self, action: #selector(didTapCompleteRoundButton), for: .touchUpInside)
    }

    @objc func didTapCompleteRoundButton() {
        
    }

}

extension CurrentMatchViewController: UITableViewDelegate {

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
