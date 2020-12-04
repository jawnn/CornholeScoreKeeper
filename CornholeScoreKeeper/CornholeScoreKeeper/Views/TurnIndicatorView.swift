import UIKit

protocol IncrementScoreDelegate: class {
    func incrementScoreAndUpdateLabel(tag: Int)
}

enum IncrementScoreButton: Int {
    case blueOnButton, blueUndoOnButton, redOnButton, redUndoOnButton,
         blueUndoInButton, blueInButton, redInButton, redUndoInButton
}

class TurnIndicatorView: UIView {

    weak var delegate: IncrementScoreDelegate?

    let bluePitcherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Blue Pitcher"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        return label
    }()

    let blueBagsLeftLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Blue: 4 Bags Left"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        return label
    }()

    let redPitcherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Red Pitcher"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        return label
    }()

    let redBagsLeftLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Red: 4 Bags Left"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        return label
    }()

    let blueInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("+3", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = IncrementScoreButton.blueInButton.rawValue
        return button
    }()

    let blueUndoInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("-3", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = IncrementScoreButton.blueUndoInButton.rawValue
        return button
    }()

    let blueOnButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("+1", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = IncrementScoreButton.blueOnButton.rawValue
        return button
    }()

    let blueUndoOnButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("-1", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = IncrementScoreButton.blueUndoOnButton.rawValue
        return button
    }()

    let roundCompleteButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Round Complete", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let redOnButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("+1", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = IncrementScoreButton.redOnButton.rawValue
        return button
    }()

    let redUndoOnButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("-1", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = IncrementScoreButton.redUndoOnButton.rawValue
        return button
    }()

    let redInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("+3", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = IncrementScoreButton.redInButton.rawValue
        return button
    }()

    let redUndoInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("-3", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = IncrementScoreButton.redUndoInButton.rawValue
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubviews(
            bluePitcherLabel, blueBagsLeftLabel, redPitcherLabel, redBagsLeftLabel,
            blueOnButton, blueUndoOnButton, redOnButton, redUndoOnButton,
            blueUndoInButton, blueInButton, redInButton, redUndoInButton
        )
        configureViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViewConstraints() {
        NSLayoutConstraint.activate([
            bluePitcherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            bluePitcherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),

            blueBagsLeftLabel.topAnchor.constraint(equalTo: bluePitcherLabel.bottomAnchor, constant: 4),
            blueBagsLeftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),

            redPitcherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            redPitcherLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),

            redBagsLeftLabel.topAnchor.constraint(equalTo: bluePitcherLabel.bottomAnchor, constant: 4),
            redBagsLeftLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),

            blueUndoOnButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            blueUndoOnButton.bottomAnchor.constraint(equalTo: blueUndoInButton.topAnchor, constant: -4),

            blueOnButton.leadingAnchor.constraint(equalTo: blueUndoOnButton.trailingAnchor, constant: 4),
            blueOnButton.bottomAnchor.constraint(equalTo: blueInButton.topAnchor, constant: -4),

            redOnButton.trailingAnchor.constraint(equalTo: redUndoOnButton.leadingAnchor, constant: -4),
            redOnButton.bottomAnchor.constraint(equalTo: redInButton.topAnchor, constant: -4),

            redUndoOnButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            redUndoOnButton.bottomAnchor.constraint(equalTo: redUndoInButton.topAnchor, constant: -4),

            blueUndoInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            blueUndoInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -4),

            blueInButton.leadingAnchor.constraint(equalTo: blueUndoOnButton.trailingAnchor, constant: 4),
            blueInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -4),

            redUndoInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            redUndoInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -4),

            redInButton.trailingAnchor.constraint(equalTo: redUndoOnButton.leadingAnchor, constant: -4),
            redInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -4),
        ])

        let incrementButtons: [UIButton] = [blueOnButton, blueUndoOnButton, redOnButton, redUndoOnButton,
                                            blueUndoInButton, blueInButton, redInButton, redUndoInButton]
        for button in incrementButtons {
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            button.widthAnchor.constraint(equalToConstant: 50).isActive = true
            button.layer.cornerRadius = 25
            button.addTarget(self, action: #selector(didTapScoreButton(sender:)), for: .touchUpInside)
        }
    }

    @objc func didTapScoreButton(sender: UIButton) {
        delegate?.incrementScoreAndUpdateLabel(tag: sender.tag)
    }

}
