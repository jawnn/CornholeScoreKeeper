import UIKit

protocol IncrementScoreDelegate: class {
    func incrementScoreAndUpdateLabel(tag: Int)
}

enum BagOutcomeButton: Int, CaseIterable {
    case blueRowOneOff, blueRowOneOn, blueRowOneIn
    case blueRowTwoOff, blueRowTwoOn, blueRowTwoIn
    case blueRowThreeOff, blueRowThreeOn, blueRowThreeIn
    case blueRowFourOff, blueRowFourOn, blueRowFourIn

    case redRowOneOff, redRowOneOn, redRowOneIn
    case redRowTwoOff, redRowTwoOn, redRowTwoIn
    case redRowThreeOff, redRowThreeOn, redRowThreeIn
    case redRowFourOff, redRowFourOn, redRowFourIn
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
//            blueButtonsStackView.widthAnchor.constraint(equalToConstant: 150),
            blueButtonsStackView.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            blueButtonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),

            lineView.widthAnchor.constraint(equalToConstant: 1),
            lineView.centerXAnchor.constraint(equalTo: centerXAnchor),
            lineView.topAnchor.constraint(equalTo: topAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),

            redButtonsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            redButtonsStackView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 8),
            redButtonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            redButtonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
        configureButtonStackViews()
    }

    private func layoutHeaderLabelsForStackViews(stackView: UIStackView, shouldReverse: Bool) {
        let titles: [String] = shouldReverse ? ["On", "In"] : ["In", "On"]
        let headerStackView = UIStackView(frame: .zero)
        headerStackView.spacing = 5
        headerStackView.axis = .horizontal
        headerStackView.distribution = .fillEqually
        for title in titles {
            let label = UILabel(frame: .zero)
            label.text = title
            label.textAlignment = .center
            headerStackView.addArrangedSubview(label)
        }
        stackView.addArrangedSubview(headerStackView)
    }

    private func configureButtonStackViews() {
        var tagIndex = 0
        for _ in 1...4 {
            let rowStackView = UIStackView(frame: .zero)
            rowStackView.spacing = 0
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            for i in 1...2 {
                let button = UIButton(frame: .zero)
                #warning("Last Checkpoint: Trying to figure out how to size the buttons within the stackView. Should investigate how to use autolayout in sync with stackview.")
//                button.translatesAutoresizingMaskIntoConstraints = false
//                button.heightAnchor.constraint(equalToConstant: 50).isActive = true
                button.tag = tagIndex
                button.layer.borderWidth = 2
                button.layer.borderColor = UIColor.blue.cgColor
                button.layer.cornerRadius = 25
                rowStackView.addArrangedSubview(button)
                tagIndex += 1
            }
            blueButtonsStackView.addArrangedSubview(rowStackView)
        }

//        for _ in 1...4 {
//            let rowStackView = UIStackView(frame: .zero)
//            rowStackView.spacing = 20
//            rowStackView.axis = .horizontal
//            rowStackView.distribution = .equalSpacing
//            for i in 1...2 {
//                let button = UIButton(frame: .zero)
//                button.layer.cornerRadius = 16
//                button.layer.borderWidth = 2
//                button.layer.borderColor = UIColor.red.cgColor
//                button.tag = tagIndex
//                rowStackView.addArrangedSubview(button)
//                tagIndex += 1
//            }
//            redButtonsStackView.addArrangedSubview(rowStackView)
//        }
    }

    @objc func didTapScoreButton(sender: UIButton) {
        delegate?.incrementScoreAndUpdateLabel(tag: sender.tag)
    }

}
