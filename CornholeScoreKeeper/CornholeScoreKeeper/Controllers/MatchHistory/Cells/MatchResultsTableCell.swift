import UIKit

class MatchResultsTableCell: UITableViewCell {

    let blueTeamIcon: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let bluePlayersLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Player 1, Player 2"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let blueScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let redTeamIcon: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let redPlayersLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Player 3, Player 4"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let redScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "MatchResultsTableCell")

        layoutCellViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutCellViews() {
        contentView.addSubviews(blueTeamIcon, bluePlayersLabel, blueScoreLabel, redTeamIcon, redPlayersLabel, redScoreLabel)

        NSLayoutConstraint.activate([
            blueTeamIcon.widthAnchor.constraint(equalToConstant: 25),
            blueTeamIcon.heightAnchor.constraint(equalToConstant: 25),
            blueTeamIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            blueTeamIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),

            bluePlayersLabel.centerYAnchor.constraint(equalTo: blueTeamIcon.centerYAnchor),
            bluePlayersLabel.leadingAnchor.constraint(equalTo: blueTeamIcon.trailingAnchor, constant: 6),

            blueScoreLabel.centerYAnchor.constraint(equalTo: blueTeamIcon.centerYAnchor),
            blueScoreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            blueScoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),

            redTeamIcon.widthAnchor.constraint(equalToConstant: 25),
            redTeamIcon.heightAnchor.constraint(equalToConstant: 25),
            redTeamIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            redTeamIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),

            redPlayersLabel.centerYAnchor.constraint(equalTo: redTeamIcon.centerYAnchor),
            redPlayersLabel.leadingAnchor.constraint(equalTo: redTeamIcon.trailingAnchor, constant: 6),

            redScoreLabel.centerYAnchor.constraint(equalTo: redTeamIcon.centerYAnchor),
            redScoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            redScoreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 6),
        ])
    }

}
