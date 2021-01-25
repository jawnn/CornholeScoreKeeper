import UIKit

class CurrentMatchViewController: UIViewController {

    private weak var matchScoreSection: MatchScoreView!
    private weak var frameHistoryTableView: UITableView!
    private weak var bagTossOutcomeSectionView: BagTossOutcomeSectionView!
    private weak var completeRoundButton: UIButton!

    var presenter: CurrentMatchPresenterType!

    override func loadView() {
        super.loadView()

        let matchScoreView = MatchScoreView(frame: .zero)
        let frameHistoryTableView = UITableView(frame: .zero)
        let bagTossOutcomeSectionView = BagTossOutcomeSectionView(frame: .zero)
        let completeRoundButton = UIButton(frame: .zero)

        frameHistoryTableView.translatesAutoresizingMaskIntoConstraints = false
        completeRoundButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews(matchScoreView, frameHistoryTableView, bagTossOutcomeSectionView, completeRoundButton)

        NSLayoutConstraint.activate([
            matchScoreView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            matchScoreView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            matchScoreView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),

            frameHistoryTableView.topAnchor.constraint(equalTo: matchScoreView.bottomAnchor, constant: 8),
            frameHistoryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            frameHistoryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            frameHistoryTableView.bottomAnchor.constraint(equalTo: bagTossOutcomeSectionView.topAnchor, constant: -8),

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
        self.bagTossOutcomeSectionView = bagTossOutcomeSectionView
        self.completeRoundButton = completeRoundButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.sendNewFrameData()
        configureFrameHistoryTableView()
        matchScoreSection.backgroundColor = .systemGray5
        matchScoreSection.layer.cornerRadius = 10

        bagTossOutcomeSectionView.delegate = presenter

        bagTossOutcomeSectionView.backgroundColor = .systemGray5
        bagTossOutcomeSectionView.layer.cornerRadius = 10
        view.backgroundColor = .white

        
        configureRoundCompleteButton()
    }

    private func configureFrameHistoryTableView() {
        frameHistoryTableView.dataSource = presenter
        frameHistoryTableView.delegate = self

        frameHistoryTableView.tableFooterView = UIView()

        frameHistoryTableView.register(FrameTableCell.self, forCellReuseIdentifier: String(describing: FrameTableCell.self))
    }

    private func configureRoundCompleteButton() {
        completeRoundButton.setTitle("Complete Round", for: .normal)
        completeRoundButton.backgroundColor = .systemGray3
        completeRoundButton.addTarget(self, action: #selector(didTapCompleteRoundButton), for: .touchUpInside)
    }

    @objc func didTapCompleteRoundButton() {
        presenter.didTeamReachScoreLimit()
    }

}

// MARK: - UITableView Delegate
extension CurrentMatchViewController: UITableViewDelegate {

}

extension CurrentMatchViewController: CurrentMatchViewType {

    func reloadFrameHistoryData() {
        frameHistoryTableView.reloadData()
    }

    func updateScore(for stepper: ScoreStepperTag, with value: Int, frameScore: Int) {
        switch stepper {
        case .onBlue:
            bagTossOutcomeSectionView.blueOnLabel.text = "On: \(value)"
            matchScoreSection.blueFrameScoreLabel.text = "\(frameScore)"
        case .inBlue:
            bagTossOutcomeSectionView.blueInLabel.text = "In: \(value)"
            matchScoreSection.blueFrameScoreLabel.text = "\(frameScore)"
        case .onRed:
            bagTossOutcomeSectionView.redOnLabel.text = "On: \(value)"
            matchScoreSection.redFrameScoreLabel.text = "\(frameScore)"
        case .inRed:
            bagTossOutcomeSectionView.redInLabel.text = "In: \(value)"
            matchScoreSection.redFrameScoreLabel.text = "\(frameScore)"
        }
    }

    func populateViewsForNextFrame(bluePitcher bluePlayerName: String, redPitcher redPlayerName: String, blueTeam blueTeamMatchScore: Int, redTeam redTeamMatchScore: Int) {
        matchScoreSection.configureScoreLabelsForNextFrame(
            bluePlayerName: bluePlayerName,
            redPlayerName: redPlayerName,
            blueTeamMatchScore: blueTeamMatchScore,
            redTeamMatchScore: redTeamMatchScore
        )
        bagTossOutcomeSectionView.resetScoreSteppers()
    }

    func showMatchDetails() {
        let vc = MatchDetailsViewController()
        present(vc, animated: true)
    }

}
