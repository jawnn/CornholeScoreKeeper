import UIKit

protocol IncrementScoreDelegate: class {
    func incrementScoreAndUpdateLabel(tag: Int)
}

enum BagOutcomeButton: Int, CaseIterable {
    case blueRowOneOn, blueRowOneIn
    case blueRowTwoOn, blueRowTwoIn
    case blueRowThreeOn, blueRowThreeIn
    case blueRowFourOn, blueRowFourIn

    case redRowOneOn, redRowOneIn
    case redRowTwoOn, redRowTwoIn
    case redRowThreeOn, redRowThreeIn
    case redRowFourOn, redRowFourIn
}

enum IncrementScoreButton: Int {
    case blueOnButton, blueUndoOnButton, redOnButton, redUndoOnButton,
         blueUndoInButton, blueInButton, redInButton, redUndoInButton
}

class BagTossOutcomeSectionView: UIView {

    weak var delegate: IncrementScoreDelegate?

    let blueButtonsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let redButtonsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let lineView = LineView(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubviews(blueButtonsStackView, lineView, redButtonsStackView)
        layoutHeaderLabelsForStackViews(stackView: blueButtonsStackView, shouldReverse: false)
        layoutHeaderLabelsForStackViews(stackView: redButtonsStackView, shouldReverse: true)
        configureViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViewConstraints() {
        NSLayoutConstraint.activate([
            blueButtonsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            blueButtonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            blueButtonsStackView.trailingAnchor.constraint(equalTo: lineView.leadingAnchor, constant: -8),
            blueButtonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),

            lineView.widthAnchor.constraint(equalToConstant: 1),
            lineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineView.topAnchor.constraint(equalTo: topAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),

            redButtonsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            redButtonsStackView.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 8),
            redButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            redButtonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
        configureButtonStackViews()
    }

    private func layoutHeaderLabelsForStackViews(stackView: UIStackView, shouldReverse: Bool) {
        let titles: [String] = shouldReverse ? ["On", "In", "Off"] : [ "Off", "In", "On"]
        let headerStackView = UIStackView(frame: .zero)
        headerStackView.spacing = 5
        headerStackView.axis = .horizontal
        headerStackView.distribution = .fillEqually
        for title in titles {
            let label = UILabel(frame: .zero)
            label.text = title
            label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
            label.textAlignment = .center
            headerStackView.addArrangedSubview(label)
        }
        stackView.addArrangedSubview(headerStackView)
    }

    private func configureButtonStackViews() {
        var tagIndex = 0
        for _ in 1...4 {
            let rowStackView = UIStackView(frame: .zero)
            rowStackView.spacing = 2
            rowStackView.axis = .horizontal
            rowStackView.distribution = .equalSpacing
            for _ in 1...3 {
                let button = UIButton(frame: .zero)
                button.tag = tagIndex
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor.blue.cgColor
                button.layer.cornerRadius = 24
                button.translatesAutoresizingMaskIntoConstraints = false
                button.heightAnchor.constraint(equalToConstant: 48).isActive = true
                button.widthAnchor.constraint(equalToConstant: 48).isActive = true
                rowStackView.addArrangedSubview(button)
                tagIndex += 1
            }
            blueButtonsStackView.addArrangedSubview(rowStackView)
        }

        for _ in 1...4 {
            let rowStackView = UIStackView(frame: .zero)
            rowStackView.spacing = 2
            rowStackView.axis = .horizontal
            rowStackView.distribution = .equalSpacing
            for _ in 1...3 {
                let button = UIButton(frame: .zero)
                button.tag = tagIndex
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor.red.cgColor
                button.layer.cornerRadius = 24
                button.translatesAutoresizingMaskIntoConstraints = false
                button.heightAnchor.constraint(equalToConstant: 48).isActive = true
                button.widthAnchor.constraint(equalToConstant: 48).isActive = true
                rowStackView.addArrangedSubview(button)
                tagIndex += 1
            }
            redButtonsStackView.addArrangedSubview(rowStackView)
        }
    }

    @objc func didTapScoreButton(sender: UIButton) {
        delegate?.incrementScoreAndUpdateLabel(tag: sender.tag)
    }

}
