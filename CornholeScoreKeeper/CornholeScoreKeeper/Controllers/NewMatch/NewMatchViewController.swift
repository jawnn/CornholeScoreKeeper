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
    }

    private func configureStartButton() {
        startMatchButton.setTitle("Start Match", for: .normal)
        startMatchButton.backgroundColor = .systemBlue
        startMatchButton.addTarget(self, action: #selector(didTapStartMatchButton), for: .touchUpInside)
    }

    @objc func didTapStartMatchButton() {
        #warning("TODO")
        // Should remain disabled and alpha 50% until player requirements are met for selected match type
        router.toCurrentMatchViewController()
    }

}

extension NewMatchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        switch presenter.selectedButtonTag {
        case AddPitcherButtonTag.leftBlueButton.rawValue:
            teamSelectView.addLeftBluePitcherButton.setTitle(cell.textLabel?.text, for: .normal)
        case AddPitcherButtonTag.leftRedButton.rawValue:
            teamSelectView.addLeftRedPitcherButton.setTitle(cell.textLabel?.text, for: .normal)
        case AddPitcherButtonTag.rightBlueButton.rawValue:
            teamSelectView.addRightBluePitcherButton.setTitle(cell.textLabel?.text, for: .normal)
        case AddPitcherButtonTag.rightRedButton.rawValue:
            teamSelectView.addRightRedPitcherButton.setTitle(cell.textLabel?.text, for: .normal)
        default:
            break
        }
        presenter.isSelecting = false
        playerSelectTableView.isHidden = true
    }
}

extension NewMatchViewController: NewMatchViewType {
    func toggleTableViewVisibility() {
        playerSelectTableView.isHidden = !presenter.isSelecting
    }
}
