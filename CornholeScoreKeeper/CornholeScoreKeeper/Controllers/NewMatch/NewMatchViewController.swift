import UIKit

class NewMatchViewController: UIViewController {

    private weak var matchTypeSegmentController: UISegmentedControl!
    private weak var teamSelectView: TeamSelectView!
    private weak var startMatchButton: UIButton!

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

        NSLayoutConstraint.activate([
            matchTypeSegmentController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            matchTypeSegmentController.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            matchTypeSegmentController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            matchTypeSegmentController.heightAnchor.constraint(equalToConstant: 44),

            teamSelectView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            teamSelectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teamSelectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            teamSelectView.heightAnchor.constraint(equalToConstant: 300),

            startMatchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            startMatchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            startMatchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            startMatchButton.heightAnchor.constraint(equalToConstant: 44)
        ])

        self.matchTypeSegmentController = matchTypeSegmentController
        self.teamSelectView = teamSelectView
        self.startMatchButton = startMatchButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMatchTypeSegmentControl()
        configureStartButton()
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
                self.teamSelectView.addRightRedPitcherButton.alpha = 0.50
                self.teamSelectView.addRightRedPitcherButton.isEnabled = false
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
    }

}
