//
//  FrameTableCell.swift
//  CornholeScoreKeeper
//
//  Created by Roberto Manese III on 12/22/20.
//

import UIKit

class FrameTableCell: UITableViewCell {

    let frameNumberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "1"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let leftLineView = LineView(frame: .zero)

    let bluePitchLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Bugcat - 6"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let redPitcherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "2 - Pusheen"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let rightLineView = LineView(frame: .zero)

    let frameOutcomeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "+4"
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
        addSubviews(frameNumberLabel, leftLineView, bluePitchLabel, redPitcherLabel, rightLineView, frameOutcomeLabel)
        configureConstraints()
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            frameNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            frameNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),

            leftLineView.leadingAnchor.constraint(equalTo: frameNumberLabel.trailingAnchor, constant: 6),
            leftLineView.widthAnchor.constraint(equalToConstant: 1),
            leftLineView.heightAnchor.constraint(equalToConstant: 50),

            bluePitchLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            bluePitchLabel.leadingAnchor.constraint(equalTo: leftLineView.trailingAnchor, constant: 12),
            bluePitchLabel.trailingAnchor.constraint(lessThanOrEqualTo: centerXAnchor, constant: -6),

            redPitcherLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            redPitcherLabel.trailingAnchor.constraint(equalTo: rightLineView.leadingAnchor, constant: -12),
            redPitcherLabel.leadingAnchor.constraint(greaterThanOrEqualTo: centerXAnchor, constant: 6),


            rightLineView.trailingAnchor.constraint(equalTo: frameOutcomeLabel.leadingAnchor, constant: -6),
            rightLineView.widthAnchor.constraint(equalToConstant: 1),
            rightLineView.heightAnchor.constraint(equalToConstant: 50),

            frameOutcomeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            frameOutcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
        ])
    }

}
