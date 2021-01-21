import UIKit

class FrameTableCell: UITableViewCell {

    let blueTeamIcon: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let bluePitcherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let blueScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let blueWinArrowView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "arrowtriangle.left.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let redTeamIcon: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let redPitcherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let redScoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let redWinArrowView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "arrowtriangle.left.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let dividerView = LineView(frame: .zero)

    let frameNumberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let frameOutcomeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.textColor = .systemBlue

        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: String(describing: FrameTableCell.self))
        selectionStyle = .none
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubviews() {
        contentView.addSubviews(
            blueTeamIcon, bluePitcherLabel, redTeamIcon, redPitcherLabel,
            blueScoreLabel, blueWinArrowView, redScoreLabel, redWinArrowView,
            dividerView, frameNumberLabel, frameOutcomeLabel
        )
        configureConstraints()
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            blueTeamIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            blueTeamIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            blueTeamIcon.bottomAnchor.constraint(equalTo: redTeamIcon.topAnchor, constant: -6),
            blueTeamIcon.heightAnchor.constraint(equalToConstant: 16),
            blueTeamIcon.widthAnchor.constraint(equalToConstant: 16),

            bluePitcherLabel.leadingAnchor.constraint(equalTo: blueTeamIcon.trailingAnchor, constant: 16),
            bluePitcherLabel.centerYAnchor.constraint(equalTo: blueTeamIcon.centerYAnchor),

            redTeamIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            redTeamIcon.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -6),
            redTeamIcon.heightAnchor.constraint(equalToConstant: 16),
            redTeamIcon.widthAnchor.constraint(equalToConstant: 16),

            redPitcherLabel.leadingAnchor.constraint(equalTo: redTeamIcon.trailingAnchor, constant: 16),
            redPitcherLabel.centerYAnchor.constraint(equalTo: redTeamIcon.centerYAnchor),

            blueScoreLabel.trailingAnchor.constraint(equalTo: blueWinArrowView.leadingAnchor, constant: -6),
            blueScoreLabel.centerYAnchor.constraint(equalTo: blueTeamIcon.centerYAnchor),

            blueWinArrowView.trailingAnchor.constraint(equalTo: dividerView.leadingAnchor, constant: -4),
            blueWinArrowView.centerYAnchor.constraint(equalTo: blueTeamIcon.centerYAnchor),
            blueWinArrowView.heightAnchor.constraint(equalToConstant: 16),
            blueWinArrowView.widthAnchor.constraint(equalToConstant: 16),

            redScoreLabel.trailingAnchor.constraint(equalTo: redWinArrowView.leadingAnchor, constant: -6),
            redScoreLabel.centerYAnchor.constraint(equalTo: redTeamIcon.centerYAnchor),

            
            redWinArrowView.trailingAnchor.constraint(equalTo: dividerView.leadingAnchor, constant: -4),
            redWinArrowView.centerYAnchor.constraint(equalTo: redTeamIcon.centerYAnchor),
            redWinArrowView.heightAnchor.constraint(equalToConstant: 16),
            redWinArrowView.widthAnchor.constraint(equalToConstant: 16),

            dividerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dividerView.trailingAnchor.constraint(equalTo: frameNumberLabel.leadingAnchor, constant: -8),
            dividerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            dividerView.widthAnchor.constraint(equalToConstant: 1),

            frameNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            frameNumberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            frameNumberLabel.bottomAnchor.constraint(equalTo: frameOutcomeLabel.topAnchor, constant: -6),
            frameNumberLabel.widthAnchor.constraint(equalToConstant: 75),

            frameOutcomeLabel.leadingAnchor.constraint(equalTo: frameNumberLabel.leadingAnchor),
            frameOutcomeLabel.bottomAnchor.constraint(equalTo: redTeamIcon.bottomAnchor)
        ])
    }

    func layoutViewConfigurations(scoringTeam: TeamColor) {
        frameOutcomeLabel.textColor = scoringTeam.color

        redScoreLabel.textColor = scoringTeam == .red ? .black : .systemGray4
        redPitcherLabel.textColor = scoringTeam == .red ? .black : .systemGray4
        blueScoreLabel.textColor = scoringTeam == .blue ? .black : .systemGray4
        bluePitcherLabel.textColor = scoringTeam == .blue ? .black : .systemGray4

        blueWinArrowView.isHidden = scoringTeam != .blue ? true : false
        redWinArrowView.isHidden = scoringTeam != .red ? true : false
    }

    override func prepareForReuse() {
        redWinArrowView.isHidden = false
        blueWinArrowView.isHidden = false
        bluePitcherLabel.textColor = .black
        blueScoreLabel.textColor = .black
        redPitcherLabel.textColor = .black
        redScoreLabel.textColor = .black
    }

}
