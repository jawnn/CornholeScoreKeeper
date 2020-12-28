import UIKit

class FrameHistoryTableHeaderView: UIView {

    let frameNumberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Frame #"
        return label
    }()

    let bluePitcherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Blue Pitcher"
        return label
    }()

    let redPitcherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Red Pitcher"
        return label
    }()

    let frameOutcomeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Frame Score"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews(frameNumberLabel, bluePitcherLabel, redPitcherLabel, frameOutcomeLabel)
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            frameNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            frameNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),

            bluePitcherLabel.centerYAnchor.constraint(equalTo: frameNumberLabel.centerYAnchor),
            bluePitcherLabel.leadingAnchor.constraint(equalTo: frameNumberLabel.trailingAnchor, constant: 8),

            redPitcherLabel.centerYAnchor.constraint(equalTo: frameNumberLabel.centerYAnchor),
            redPitcherLabel.trailingAnchor.constraint(equalTo: frameOutcomeLabel.leadingAnchor, constant: -8),

            frameOutcomeLabel.centerYAnchor.constraint(equalTo: frameNumberLabel.centerYAnchor),
            frameOutcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
        ])
    }

}
