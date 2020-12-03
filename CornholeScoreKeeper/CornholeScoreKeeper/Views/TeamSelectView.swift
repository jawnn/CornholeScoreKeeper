import UIKit

protocol TeamSelectViewDelegate: class {
    var isSelecting: Bool { get set }
    var selectedButtonTag: Int { get set }
    func placeSelectedPlayerOnTeam(tag: Int)
}

enum AddPitcherButtonTag: Int {
    case leftBlueButton
    case leftRedButton
    case rightBlueButton
    case rightRedButton
}

class TeamSelectView: UIView {

    let addLeftBluePitcherButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Join Blue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.tag = AddPitcherButtonTag.leftBlueButton.rawValue
        return button
    }()

    let leftBoardView: CornholeBoardView = {
        let view = CornholeBoardView(frame: .zero, direction: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()

    let addLeftRedPitcherButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Join Red", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemRed
        button.tag = AddPitcherButtonTag.leftRedButton.rawValue
        return button
    }()

    let versusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "V.S"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let addRightBluePitcherButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Join Blue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.tag = AddPitcherButtonTag.rightBlueButton.rawValue
        return button
    }()

    let rightBoardView: CornholeBoardView = {
        let view = CornholeBoardView(frame: .zero, direction: false)
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let addRightRedPitcherButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Join Red", for: .normal)
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = AddPitcherButtonTag.rightRedButton.rawValue
        return button
    }()

    weak var delegate: TeamSelectViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemGray
        layer.cornerRadius = 10
        addSubviews(addLeftBluePitcherButton, leftBoardView, addLeftRedPitcherButton,
                    versusLabel,
                    addRightBluePitcherButton, rightBoardView, addRightRedPitcherButton)
        configureViewConstraints()
        configureTargetForJoinButtons()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViewConstraints() {
        NSLayoutConstraint.activate([
            addLeftBluePitcherButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addLeftBluePitcherButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            addLeftBluePitcherButton.bottomAnchor.constraint(equalTo: leftBoardView.topAnchor, constant: -8),
            addLeftBluePitcherButton.heightAnchor.constraint(equalToConstant: 75),
            addLeftBluePitcherButton.widthAnchor.constraint(equalToConstant: 100),

            leftBoardView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftBoardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            leftBoardView.heightAnchor.constraint(equalToConstant: 100),
            leftBoardView.widthAnchor.constraint(equalToConstant: 150),

            addLeftRedPitcherButton.topAnchor.constraint(equalTo: leftBoardView.bottomAnchor, constant: 8),
            addLeftRedPitcherButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            addLeftRedPitcherButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            addLeftRedPitcherButton.heightAnchor.constraint(equalToConstant: 75),
            addLeftRedPitcherButton.widthAnchor.constraint(equalToConstant: 100),

            versusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            versusLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            addRightBluePitcherButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addRightBluePitcherButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            addRightBluePitcherButton.heightAnchor.constraint(equalToConstant: 75),
            addRightBluePitcherButton.widthAnchor.constraint(equalToConstant: 100),

            rightBoardView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightBoardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            rightBoardView.heightAnchor.constraint(equalToConstant: 100),
            rightBoardView.widthAnchor.constraint(equalToConstant: 150),

            addRightRedPitcherButton.topAnchor.constraint(equalTo: rightBoardView.bottomAnchor, constant: 8),
            addRightRedPitcherButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            addRightRedPitcherButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            addRightRedPitcherButton.heightAnchor.constraint(equalToConstant: 75),
            addRightRedPitcherButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func configureTargetForJoinButtons() {
        let buttons = [addLeftBluePitcherButton, addLeftRedPitcherButton, addRightBluePitcherButton, addRightRedPitcherButton]
        for button in buttons {
            button.addTarget(self, action: #selector(didTapJoinButton(sender:)), for: .touchUpInside)
        }
    }

    @objc func didTapJoinButton(sender: UIButton) {
        delegate?.placeSelectedPlayerOnTeam(tag: sender.tag)
    }

}
