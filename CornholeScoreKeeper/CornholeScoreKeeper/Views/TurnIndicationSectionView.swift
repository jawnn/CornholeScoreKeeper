import UIKit

class TurnIndicationSectionView: UIView {

    let bluePitcherNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Blue Pitcher"
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let blueBagsLeftView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let redPitcherNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Red Pitcher"
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let redBagsLeftView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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

    private func configureSubviews() {
        addSubviews(bluePitcherNameLabel, blueBagsLeftView, redPitcherNameLabel, redBagsLeftView)

        NSLayoutConstraint.activate([
            bluePitcherNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            bluePitcherNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),

            blueBagsLeftView.topAnchor.constraint(equalTo: bluePitcherNameLabel.bottomAnchor, constant: 8),
            blueBagsLeftView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),

            redPitcherNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            redPitcherNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),

            redBagsLeftView.topAnchor.constraint(equalTo: redPitcherNameLabel.bottomAnchor, constant: 6),
            redBagsLeftView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
        ])

        populateBags(stackView: blueBagsLeftView, color: .systemBlue)
        populateBags(stackView: redBagsLeftView, color: .systemRed)
    }

    private func populateBags(stackView: UIStackView, color: UIColor) {
        for _ in 1...4 {
            let bagView = UIView(frame: .zero)
            bagView.backgroundColor = color
            bagView.layer.cornerRadius = 10
            bagView.translatesAutoresizingMaskIntoConstraints = false
            bagView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            bagView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            stackView.addArrangedSubview(bagView)
        }
    }

}
