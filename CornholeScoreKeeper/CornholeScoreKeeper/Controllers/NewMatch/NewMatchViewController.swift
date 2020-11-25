import UIKit

class NewMatchViewController: UIViewController {

    private weak var matchTypeSegmentController: UISegmentedControl!
    private weak var teamSelectView: UIView!
    private weak var startMatchButton: UIButton!

    override func loadView() {
        super.loadView()

        let matchTypeSegmentController = UISegmentedControl(items: ["Singles", "Doubles"])
        matchTypeSegmentController.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(matchTypeSegmentController)

        let teamSelectView = UIView(frame: .zero)
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
            teamSelectView.heightAnchor.constraint(equalToConstant: 150),

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

        configureStartButton()
    }

    private func configureStartButton() {
        startMatchButton.setTitle("Start Match", for: .normal)
        startMatchButton.backgroundColor = .systemBlue
        startMatchButton.addTarget(self, action: #selector(didTapStartMatchButton), for: .touchUpInside)
    }

    @objc func didTapStartMatchButton() {

    }

}
