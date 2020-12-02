import UIKit

class MatchScoreView: UIView {

    let matchScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .systemGray3
        label.text = "Match Score"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let blueMatchScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.backgroundColor = .systemGray3
        label.text = "0"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let matchScoreLineDivider = LineView()

    let redMatchScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
        label.backgroundColor = .systemGray3
        label.text = "0"
        label.textColor = .systemRed
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let frameScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.backgroundColor = .systemGray3
        label.text = "Frame Score"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let blueFrameScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.backgroundColor = .systemGray3
        label.text = "0"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let frameScoreLineDivider = LineView()

    let redFrameScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.backgroundColor = .systemGray3
        label.text = "0"
        label.textColor = .systemRed
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        configureViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViewConstraints() {
        addSubviews(
            matchScoreLabel,
            blueMatchScoreLabel, matchScoreLineDivider, redMatchScoreLabel,
            frameScoreLabel,
            blueFrameScoreLabel, frameScoreLineDivider, redFrameScoreLabel
        )

        NSLayoutConstraint.activate([
            matchScoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            matchScoreLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 6),

            blueMatchScoreLabel.topAnchor.constraint(equalTo: matchScoreLabel.bottomAnchor, constant: 4),
            blueMatchScoreLabel.trailingAnchor.constraint(equalTo: matchScoreLabel.leadingAnchor, constant: -8),

            matchScoreLineDivider.heightAnchor.constraint(equalToConstant: 4),
            matchScoreLineDivider.centerXAnchor.constraint(equalTo: centerXAnchor),
            matchScoreLineDivider.centerYAnchor.constraint(equalTo: blueMatchScoreLabel.centerYAnchor),
            matchScoreLineDivider.leadingAnchor.constraint(equalTo: blueMatchScoreLabel.trailingAnchor, constant: 8),
            matchScoreLineDivider.trailingAnchor.constraint(equalTo: redMatchScoreLabel.leadingAnchor, constant: -8),

            redMatchScoreLabel.topAnchor.constraint(equalTo: matchScoreLabel.bottomAnchor, constant: 4),
            redMatchScoreLabel.leadingAnchor.constraint(equalTo: matchScoreLabel.trailingAnchor, constant: 8),

            frameScoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            frameScoreLabel.topAnchor.constraint(equalTo: redMatchScoreLabel.bottomAnchor, constant: 6),

            blueFrameScoreLabel.topAnchor.constraint(equalTo: frameScoreLabel.bottomAnchor, constant: 4),
            blueFrameScoreLabel.trailingAnchor.constraint(equalTo: frameScoreLabel.leadingAnchor, constant: -8),
            blueFrameScoreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),

            frameScoreLineDivider.heightAnchor.constraint(equalToConstant: 2),
            frameScoreLineDivider.centerXAnchor.constraint(equalTo: centerXAnchor),
            frameScoreLineDivider.centerYAnchor.constraint(equalTo: blueFrameScoreLabel.centerYAnchor),
            frameScoreLineDivider.leadingAnchor.constraint(equalTo: blueFrameScoreLabel.trailingAnchor, constant: 8),
            frameScoreLineDivider.trailingAnchor.constraint(equalTo: redFrameScoreLabel.leadingAnchor, constant: -8),

            redFrameScoreLabel.topAnchor.constraint(equalTo: frameScoreLabel.bottomAnchor, constant: 4),
            redFrameScoreLabel.leadingAnchor.constraint(equalTo: frameScoreLabel.trailingAnchor, constant: 8),
            redFrameScoreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6)
        ])
    }

}
