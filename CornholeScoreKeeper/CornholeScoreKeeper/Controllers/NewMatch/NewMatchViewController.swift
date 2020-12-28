import UIKit

class NewMatchViewController: UIViewController {

    private weak var matchTypeSegmentController: UISegmentedControl!
    private weak var teamSelectView: TeamSelectView!
    private weak var playerSelectTableView: UITableView!
    private weak var startMatchButton: UIButton!

    var presenter: NewMatchPresenterType!
    var router: NewMatchRouterType!

    override func loadView() {
        super.loadView()

        let matchTypeSegmentController = UISegmentedControl(items: ["Singles", "Doubles"])
        matchTypeSegmentController.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(matchTypeSegmentController)

        let teamSelectView = TeamSelectView(frame: .zero)
        teamSelectView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(teamSelectView)

        let startMatchButton = UIButton(frame: .zero)
        startMatchButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startMatchButton)

        let playerSelectTableView = UITableView(frame: .zero)
        playerSelectTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playerSelectTableView)

        NSLayoutConstraint.activate([
            matchTypeSegmentController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            matchTypeSegmentController.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            matchTypeSegmentController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            matchTypeSegmentController.heightAnchor.constraint(equalToConstant: 44),

            teamSelectView.topAnchor.constraint(equalTo: matchTypeSegmentController.bottomAnchor, constant: 8),
            teamSelectView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            teamSelectView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),

            playerSelectTableView.topAnchor.constraint(equalTo: teamSelectView.bottomAnchor, constant: 8),
            playerSelectTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            playerSelectTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            playerSelectTableView.bottomAnchor.constraint(equalTo: startMatchButton.topAnchor, constant: -8),

            startMatchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            startMatchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            startMatchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            startMatchButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        self.matchTypeSegmentController = matchTypeSegmentController
        self.teamSelectView = teamSelectView
        self.playerSelectTableView = playerSelectTableView
        self.startMatchButton = startMatchButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        teamSelectView.delegate = presenter
        configureMatchTypeSegmentControl()
        configurePlayerSelectTableView()
        configureStartButton()
    }

    private func configurePlayerSelectTableView() {
        playerSelectTableView.isHidden = true
        playerSelectTableView.layer.cornerRadius = 15
        playerSelectTableView.backgroundColor = .systemTeal
        playerSelectTableView.dataSource = presenter
        playerSelectTableView.delegate = self
    }

    private func configureMatchTypeSegmentControl() {
        matchTypeSegmentController.backgroundColor = .systemGray
        matchTypeSegmentController.tintColor = .systemGray5
        matchTypeSegmentController.selectedSegmentIndex = 0

        if matchTypeSegmentController.selectedSegmentIndex == 0 {
            teamSelectView.addRightBluePitcherButton.alpha = 0.50
            teamSelectView.addRightBluePitcherButton.isEnabled = false
            teamSelectView.addRightRedPitcherButton.alpha = 0.50
            teamSelectView.addRightRedPitcherButton.isEnabled = false
        }

        matchTypeSegmentController.addTarget(self, action: #selector(didChangeMatchType(sender:)), for: .valueChanged)
    }

    @objc func didChangeMatchType(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case MatchType.single.rawValue:
            conformTeamsForSingleMatchTypeConfiguration()
            UIView.animate(withDuration: 0.20) {
                self.teamSelectView.addRightBluePitcherButton.alpha = 0.50
                self.teamSelectView.addRightBluePitcherButton.isEnabled = false
                self.teamSelectView.addRightBluePitcherButton.setTitle("Join Blue", for: .normal)
                self.teamSelectView.addRightRedPitcherButton.alpha = 0.50
                self.teamSelectView.addRightRedPitcherButton.isEnabled = false
                self.teamSelectView.addRightRedPitcherButton.setTitle("Join Red", for: .normal)
            }
        case MatchType.doubles.rawValue:
            UIView.animate(withDuration: 0.10) {
                self.teamSelectView.addRightBluePitcherButton.isEnabled.toggle()
                self.teamSelectView.addRightBluePitcherButton.alpha = 1
                self.teamSelectView.addRightRedPitcherButton.isEnabled.toggle()
                self.teamSelectView.addRightRedPitcherButton.alpha = 1
            }
        default:
            break
        }
        animateStartButton()
    }

    private func conformTeamsForSingleMatchTypeConfiguration() {
        if presenter.redTeam.players.count == 2 {
            presenter.redTeam.players.removeLast()
        }
        if presenter.blueTeam.players.count == 2 {
            presenter.blueTeam.players.removeLast()
        }
    }

    private func configureStartButton() {
        startMatchButton.alpha = 0.25
        startMatchButton.isEnabled = true
        startMatchButton.setTitle("Not enough players", for: .normal)
        startMatchButton.backgroundColor = .systemBlue
        startMatchButton.addTarget(self, action: #selector(didTapStartMatchButton), for: .touchUpInside)
    }

    private func shouldStartMatchButtonBeEnabled() -> Bool {
        let matchType: MatchType = matchTypeSegmentController.selectedSegmentIndex == 0 ? .single : .doubles
        let totalPlayers = presenter.redTeam.players.count + presenter.blueTeam.players.count
        return totalPlayers == matchType.totalAllowedPlayers ? true : false
    }

    private func animateStartButton() {
        if shouldStartMatchButtonBeEnabled() {
            UIView.animate(withDuration: 0.25) {
                self.startMatchButton.alpha = 1
                self.startMatchButton.isEnabled = true
                self.startMatchButton.setTitle("Start match", for: .normal)
            }
        } else {
            UIView.animate(withDuration: 0.25) {
                self.startMatchButton.alpha = 0.25
                self.startMatchButton.isEnabled = false
                self.startMatchButton.setTitle("Not enough players", for: .normal)
            }
        }
    }

    @objc func didTapStartMatchButton() {
        let matchType: MatchType = matchTypeSegmentController.selectedSegmentIndex == 0 ? .single : .doubles
        router.toCurrentMatchViewController(redTeam: presenter.redTeam, blueTeam: presenter.blueTeam, matchType: matchType)
    }

}

extension NewMatchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TextFieldHeaderView()
        headerView.delegate = presenter
        return headerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath),
              let name = cell.textLabel?.text else {
            return
        }
        teamSelectView.populatePitchButtonTitle(tag: presenter.selectedButtonTag, playerName: name)
        presenter.appendPlayerToTeam(index: indexPath.row, tag: presenter.selectedButtonTag)
        presenter.isSelecting = false
        playerSelectTableView.isHidden = true
        animateStartButton()
    }
}

extension NewMatchViewController: NewMatchViewType {
    func reloadTableData() {
        playerSelectTableView.reloadData()
    }

    func toggleTableViewVisibility() {
        playerSelectTableView.isHidden = !presenter.isSelecting
    }
}
