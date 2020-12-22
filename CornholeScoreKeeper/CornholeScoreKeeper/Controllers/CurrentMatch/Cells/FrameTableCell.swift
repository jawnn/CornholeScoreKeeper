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
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let leftLineView = LineView(frame: .zero)

    let bluePitchLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Bugcat - 6"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let redPitcherLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Pusheen - 2"
        label.font = .systemFont(ofSize: 14, weight: .medium)
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
            frameNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            frameNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),

            leftLineView.leadingAnchor.constraint(equalTo: frameNumberLabel.trailingAnchor, constant: 2),
            leftLineView.topAnchor.constraint(equalTo: topAnchor),
            leftLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftLineView.widthAnchor.constraint(equalToConstant: 1),

            bluePitchLabel.leadingAnchor.constraint(equalTo: leftLineView.trailingAnchor, constant: 4),
            bluePitchLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),

            redPitcherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            redPitcherLabel.trailingAnchor.constraint(equalTo: rightLineView.leadingAnchor, constant: -4),

            rightLineView.trailingAnchor.constraint(equalTo: frameOutcomeLabel.leadingAnchor, constant: -2),
            rightLineView.topAnchor.constraint(equalTo: topAnchor),
            rightLineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            rightLineView.widthAnchor.constraint(equalToConstant: 1),

            frameOutcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            frameOutcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6)
        ])
    }

}
