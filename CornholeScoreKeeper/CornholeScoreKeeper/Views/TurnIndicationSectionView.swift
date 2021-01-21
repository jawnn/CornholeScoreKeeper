import UIKit

class TurnIndicationSectionView: UIView {

    let bluePitcherNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let redPitcherNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let firstTossBadgeView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemYellow
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configurePlayerLabelsForNextFrame(blueName: String, redName: String) {
        redPitcherNameLabel.text = redName
        bluePitcherNameLabel.text = blueName
    }

    private func configureSubviews() {
        addSubviews(bluePitcherNameLabel, redPitcherNameLabel)

        NSLayoutConstraint.activate([
            bluePitcherNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            bluePitcherNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            bluePitcherNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 6),

            redPitcherNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            redPitcherNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            redPitcherNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 6),

        ])
    }

}
